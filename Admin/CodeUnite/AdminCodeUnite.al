codeunit 50121 AdminTaskCode
{
    procedure TaskCardPage(var No: Integer)
    var
        projectId: Integer;
        taskCard: Page "TaskPageCard";
        tasks: Record Tasks;
        lastId: Integer;
    begin
        projectId := No;
        tasks.Init();
        tasks.ProjectID := projectId;
        tasks.Insert();
        taskCard.SetRecord(tasks);
        taskCard.Run();
    end;
}
