codeunit 50130 WebGet
{
    //Accepts parameters: Username and Password
    procedure Login(Username: Text; Password: Text) result: Text;
    var
        EmpRec: Record EmployeeTable;
        temp: HttpResponseMessage;
        JEmp: JsonObject;
        SalesLine: Record "Sales Line";
    begin
        //Trims any whitespace
        Username := Username.Trim();
        Password := Password.Trim();
        //Matches username/password entered with the params inside Employee Table
        EmpRec.SetFilter(Username, Username);
        EmpRec.SetFilter(Password, Password);
        //If match is found in Employee: True
        if not EmpRec.IsEmpty and not (Username = '') and not (Password = '') then begin
            EmpRec.FindFirst();
            JEmp.Add('EmpID', EmpRec.EmpID);
            JEmp.Add('FirstName', EmpRec.FirstName);
            JEmp.Add('LastName', EmpRec.LastName);
            JEmp.Add('Boolean', true);
        end
        //If match is not found or User/pass are empty strings, create JSON object with empty strings
        else begin
            JEmp.Add('EmpID', '');
            JEmp.Add('FirstName', '');
            JEmp.Add('LastName', '');
            JEmp.Add('Boolean', false);
        end;

        //result returned as Text
        JEmp.WriteTo(result);
    end;


    procedure GetProjectTask(empId: Integer) result: Text
    var
        TaskTable: Record TasksTable;
        ProjectListIDTemp: List of [Integer];
        ProjectListID: List of [Integer];
        ProjectId: Integer;
        Json: JsonArray;
    begin
        //Filters TaskTable based on Employee ID
        TaskTable.SetFilter(EmpID, Format(empId));
        TaskTable.SetFilter(TaskFinished, Format(false));


        if TaskTable.FindSet() then
            repeat
                //Find all Project IDs from TaskTable with filtered Employee ID
                ProjectListIDTemp.Add(TaskTable.ProjectID);
            until TaskTable.Next() = 0;

        //Removes all duplicates
        foreach ProjectId IN ProjectListIDTemp do begin
            if not ProjectListID.Contains(ProjectId) then begin
                ProjectListID.Add(ProjectId);
            end;
        end;
        //Call method to create Json Array
        Json := JsonProjectTask(ProjectListID, empId);
        //Convert Json Array to "sendable" text
        json.WriteTo(result)
    end;


    //Params: List of Project IDs and Employee ID
    //Returns: Json Array
    local procedure JsonProjectTask(ProjectList: List of [Integer]; empId: Integer) result: JsonArray
    var
        ProjectTabel: Record Projects;
        ProjectId: Integer;
        TaskId: Integer;
        JsonArrayProjectTask: JsonArray;
    begin
        //Iterate the project list with the IDs
        foreach ProjectId IN ProjectList do begin
            //Filter Project Table from IDs and if the project has not been completed
            ProjectTabel.SetFilter(ProjectID, Format(ProjectId));
            ProjectTabel.SetFilter(ProjectDone, Format(false));

            //Is there any records for your filters? If yes: call the method for Json Array Creation of Projects
            if ProjectTabel.FindFirst() then begin
                AddProjectToJson(ProjectTabel, empId, JsonArrayProjectTask);
            end;
        end;
        //Return Json Array of Project AND Tasks
        result := JsonArrayProjectTask;
    end;



    //Params: Project Table off of the filtered table, EmployeeID and overarching array
    //Return: None(technically: Overaching array)
    local procedure AddProjectToJson(ProjectTable: Record Projects; empId: Integer; JsonArrayProjectTaskArray: JsonArray)
    var
        TaskTable: Record TasksTable;
        JsonProjectObject: JsonObject;
        JsonTaskArray: JsonArray;
    begin
        //Add Project(ID, Name) to json body
        JsonProjectObject.Add('ProjectID', ProjectTable.ProjectID);
        JsonProjectObject.Add('ProjectName', ProjectTable.ProjectName);

        //Filter the Tasks depending on Employee ID, Project ID and if the Task is finished or not
        TaskTable.SetFilter(EmpID, Format(empId));
        TaskTable.SetFilter(ProjectID, Format(ProjectTable.ProjectID));
        TaskTable.SetFilter(TaskFinished, Format(false));
        //Find the set of all Tasks you got from filter, and iterate through them
        if TaskTable.FindSet() then
            repeat
                //Call the method to add Task to an overarching Json Array
                AddTaskToJsonArray(TaskTable, JsonTaskArray);
            until TaskTable.Next() = 0;

        //Add Overarching Json Array(of tasks) to Json Object
        JsonProjectObject.Add('taskList', JsonTaskArray);
        //Add Json object to overarching json array(of everything)
        JsonArrayProjectTaskArray.Add(JsonProjectObject);
    end;

    //Params: TaskTable from filter and the overarching json array(of tasks)
    //Return: None(Technically: Overarching Array(of tasks))
    local procedure AddTaskToJsonArray(TaskTable: Record TasksTable; JsonArrayTask: JsonArray)
    var
        JsonTaskObject: JsonObject;
    begin
        //Add all the necessary info to Json Object
        JsonTaskObject.Add('taskID', TaskTable.TaskID);
        JsonTaskObject.Add('projectID', TaskTable.ProjectID);
        JsonTaskObject.Add('taskName', TaskTable.TaskName);
        JsonTaskObject.Add('description', TaskTable.Description);
        JsonTaskObject.Add('taskPlanTime', TaskTable.TaskPlanTime);
        JsonTaskObject.Add('totalTimeUsed', TaskTable.TotalTimeUsed);
        JsonTaskObject.Add('taskStatus', TaskTable.TaskFinished);
        //Add everything to overarching json array(of tasks)
        JsonArrayTask.Add(JsonTaskObject);
    end;

}



codeunit 50131 webInsert
{
    //Params: Task Class/Task Table
    //Return: Boolean
    procedure UpdateTimeUsed(TaskID: Integer; ProjectID: Integer; TaskName: Text; Description: Text; TotalTimeUsed: Decimal; TaskPlanTime: Integer; TaskStatus: Boolean) result: Boolean
    var
        TaskTable: Record TasksTable;
        DoneNotDone: Boolean;
    begin
        //Set Boolean to False, incase nothing happens
        DoneNotDone := false;
        //Filter all the data
        TaskTable.SetFilter(TaskID, Format(TaskID));
        TaskTable.SetFilter(ProjectID, Format(ProjectID));
        TaskTable.SetFilter(TaskName, TaskName);
        TaskTable.SetFilter(Description, Description);
        TaskTable.SetFilter(TaskPlanTime, Format(TaskPlanTime));
        //Find Table based on findfirst and add timeUsed to Task Table
        if TaskTable.FindFirst() then begin
            TaskTable.FindFirst();
            if TaskTable.TaskFinished = false then begin
                TaskTable.FindFirst();
                TaskTable.TotalTimeUsed := Round(TotalTimeUsed);
                TaskTable.Modify();
                //If Task is not finished and incoming TaskStatus is true, then place TaskTables Status to true
                if (TaskTable.TaskFinished = false) and (TaskStatus = true) then begin
                    TaskTable.TaskFinished := true;
                    TaskTable.Modify();
                end;
                //If change happened, change boolean to true(to indicate something happened)
                DoneNotDone := true;
            end;

        end;
        //Return: Boolean
        result := DoneNotDone;
    end;
}