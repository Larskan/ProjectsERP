//Open Page with Insert
codeunit 50121 AdminTaskCode
{
    procedure TaskCardPage(var No: Integer)
    var
        projectId: Integer;
        taskCard: Page "TaskPageCard";
        tasks: Record TasksTable;
    begin
        projectId := No;
        tasks.Init();
        tasks.ProjectID := projectId;
        tasks.Insert();
        taskCard.SetRecord(tasks);
        taskCard.Run();
    end;

    procedure SelectTask(var Task: Record TasksTable)
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

    procedure OpenEmpDoc(var Task: Record TasksTable)
    var
        taskId: Text;
        EmployeeTaskDocument: Page "EmployeeTaskDocument";
        tasks: Record TasksTable;
        countAmount: Integer;
    begin
        if Task.FindSet() then
            repeat
                countAmount += 1;
            until task.Next() = 0;
        if countAmount = 1 then begin
            Task.FindFirst();
            taskId := Format(Task.TaskID);
            tasks.SetFilter(TaskID, taskId);
            EmployeeTaskDocument.SetRecord(Task);
            EmployeeTaskDocument.Run();
        end
        else begin
            Message('Select Only One');
        end;
    end;

    procedure MarkTaskDone(var projectId: Integer)
    var
        TaskTable: Record TasksTable;
    begin
        if TaskTable.FindSet() then
            repeat
                if TaskTable.ProjectID = projectId then begin
                    TaskTable.TaskFinished := true;
                    TaskTable.Modify();
                end;
            until TaskTable.Next() = 0;
    end;
}