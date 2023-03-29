codeunit 50130 WebGet
{
    procedure Number(x: Integer; y: Integer) result: Integer
    begin
        result := x + y;
    end;

    procedure Login(Username: Text; Password: Text) result: Text;
    var
        EmpRec: Record EmployeeTable;
        temp: HttpResponseMessage;
        JEmp: JsonObject;
    begin
        Username := Username.Trim();
        Password := Password.Trim();
        EmpRec.SetFilter(Username, Username);
        EmpRec.SetFilter(Password, Password);
        if not EmpRec.IsEmpty and not (Username = '') and not (Password = '') then begin
            EmpRec.FindFirst();
            JEmp.Add('EmpID', EmpRec.EmpID);
            JEmp.Add('FirstName', EmpRec.FirstName);
            JEmp.Add('LastName', EmpRec.LastName);
            JEmp.Add('Boolean', true);
        end
        else begin
            JEmp.Add('EmpID', '');
            JEmp.Add('FirstName', '');
            JEmp.Add('LastName', '');
            JEmp.Add('Boolean', false);
        end;

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
        TaskTable: Record TasksTable;
        ProjectTabel: Record Projects;
        ProjectId: Integer;
        TaskId: Integer;
        JsonArrayProjectTask: JsonArray;
    begin
        foreach ProjectId IN ProjectList do begin
            ProjectTabel.SetFilter(ProjectID, Format(ProjectId));

            ProjectTabel.FindFirst();

            AddProjectToJson(ProjectTabel, TaskTable, empId, JsonArrayProjectTask);

        end;
        result := JsonArrayProjectTask;
    end;



    local procedure AddProjectToJson(ProjectTable: Record Projects; TaskTable: Record TasksTable; empId: Integer; JsonArrayProjectTaskArray: JsonArray)
    var
        JsonProjectObject: JsonObject;
        JsonTaskArray: JsonArray;
    begin

        JsonProjectObject.Add('ProjectID', ProjectTable.ProjectID);
        JsonProjectObject.Add('ProjectName', ProjectTable.ProjectName);

        TaskTable.SetFilter(EmpID, Format(empId));
        TaskTable.SetFilter(ProjectID, Format(ProjectTable.ProjectID));
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
        JsonArrayTask.Add(JsonTaskObject);
    end;
}


codeunit 50131 webInsert
{
    procedure Number(x: Integer; y: Integer) result: Integer
    begin
        result := x + y;
    end;
}