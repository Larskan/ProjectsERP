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

    procedure SelectTask(var Task: Record Tasks)
    var
        taskPage: page TaskPageCard;
        countAmount: Integer;
    begin
        if task.FindSet() then
            repeat
                countAmount += 1;
            until task.Next() = 0;
        if countAmount = 1 then begin
            Task.FindFirst();
            taskPage.SetRecord(Task);
            taskPage.Run();
        end
        else begin
            Message('Select Only One');
        end;
    end;
}
