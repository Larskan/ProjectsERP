codeunit 50101 AdminTaskCode
{
    procedure TaskCardPage(var No: Integer)
    var
        projectId: Integer;
        taskCard: Page "TaskPageCard";
    begin
        projectId := No;

        taskCard.Run();
    end;
}
