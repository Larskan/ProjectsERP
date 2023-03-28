//4) Employee can see their accessed projects with tasks with time registrations
codeunit 50116 AccessProjects
{

    procedure AccessProjectsFromEmployee(EmpID: Integer): List of [Text]
    var
        Task: Record TasksTable;
        Project: Record Projects;
        ProjectsList: List of [Text];
    begin
        //ProjectsList := [];

        Task.SetRange("EmpID", EmpID);
        if Task.FindSet then begin
            repeat
                Project.Get(Task.ProjectID);
                ProjectsList.Add(Project.ProjectName);
            until (Task.Next = 0);
        end
    end;

}
