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
        TaskTable.SetFilter(EmpID, Format(empId));
        TaskTable.SetFilter(TaskFinished, Format(false));

        if TaskTable.FindSet() then
            repeat
                ProjectListIDTemp.Add(TaskTable.ProjectID);
            until TaskTable.Next() = 0;

        foreach ProjectId IN ProjectListIDTemp do begin
            if not ProjectListID.Contains(ProjectId) then begin
                ProjectListID.Add(ProjectId);
            end;
        end;

        Json := JsonProjectTask(ProjectListID, empId);
        json.WriteTo(result)
    end;


    local procedure JsonProjectTask(ProjectList: List of [Integer]; empId: Integer) result: JsonArray
    var
        ProjectTabel: Record Projects;
        ProjectId: Integer;
        TaskId: Integer;
        JsonArrayProjectTask: JsonArray;
    begin
        foreach ProjectId IN ProjectList do begin
            ProjectTabel.SetFilter(ProjectID, Format(ProjectId));
            ProjectTabel.SetFilter(ProjectDone, Format(false));

            if ProjectTabel.FindFirst() then begin
                AddProjectToJson(ProjectTabel, empId, JsonArrayProjectTask);
            end;
        end;
        result := JsonArrayProjectTask;
    end;



    local procedure AddProjectToJson(ProjectTable: Record Projects; empId: Integer; JsonArrayProjectTaskArray: JsonArray)
    var
        TaskTable: Record TasksTable;
        JsonProjectObject: JsonObject;
        JsonTaskArray: JsonArray;
    begin
        JsonProjectObject.Add('ProjectID', ProjectTable.ProjectID);
        JsonProjectObject.Add('ProjectName', ProjectTable.ProjectName);

        TaskTable.SetFilter(EmpID, Format(empId));
        TaskTable.SetFilter(ProjectID, Format(ProjectTable.ProjectID));
        TaskTable.SetFilter(TaskFinished, Format(false));
        if TaskTable.FindSet() then
            repeat
                AddTaskToJsonArray(TaskTable, JsonTaskArray);
            until TaskTable.Next() = 0;

        JsonProjectObject.Add('TaskList', JsonTaskArray);

        JsonArrayProjectTaskArray.Add(JsonProjectObject);
    end;

    local procedure AddTaskToJsonArray(TaskTable: Record TasksTable; JsonArrayTask: JsonArray)
    var
        JsonTaskObject: JsonObject;
    begin
        JsonTaskObject.Add('TaskID', TaskTable.TaskID);
        JsonTaskObject.Add('ProjectID', TaskTable.ProjectID);
        JsonTaskObject.Add('TaskName', TaskTable.TaskName);
        JsonTaskObject.Add('Description', TaskTable.Description);
        JsonTaskObject.Add('TaskPlanTime', TaskTable.TaskPlanTime);
        JsonTaskObject.Add('TotalTimeUsed', TaskTable.TotalTimeUsed);
        JsonArrayTask.Add(JsonTaskObject);
    end;

}



codeunit 50131 webInsert
{
    procedure UpdateTimeUsed(TaskID: Integer; ProjectID: Integer; TaskName: Text; Description: Text; TimeUsed: Decimal; PlanTime: Decimal) result: Boolean
    var
        TaskTable: Record TasksTable;
        DoneNotDone: Boolean;
    begin
        DoneNotDone := false;
        TaskTable.SetFilter(TaskID, Format(TaskID));
        TaskTable.SetFilter(ProjectID, Format(ProjectID));
        TaskTable.SetFilter(TaskName, TaskName);
        TaskTable.SetFilter(Description, Description);
        TaskTable.SetFilter(TotalTimeUsed, Format(Round(TimeUsed)));
        TaskTable.SetFilter(TaskPlanTime, Format(PlanTime));

        if TaskTable.FindFirst() then begin
            TaskTable.FindFirst();
            TaskTable.TotalTimeUsed := Round(TimeUsed);
            DoneNotDone := true;
        end;

        result := DoneNotDone;
    end;
}