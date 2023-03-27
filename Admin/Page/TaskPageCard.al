page 50125 TaskPageCard
{
    ApplicationArea = All;
    Caption = 'TaskPageCard';
    PageType = Card;
    SourceTable = Tasks;


    layout
    {
        area(content)
        {
            group(General)
            {
                field(TaskName; Rec.TaskName)
                {
                    ToolTip = 'Specifies the value of the TaskName field.';
                }
                field(TaskPlanTime; Rec.TaskPlanTime)
                {
                    ToolTip = 'Specifies the value of the TaskPlanTime field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    MultiLine = true;
                    Width = 200;
                }
                field(TaskFinished; Rec.TaskFinished)
                {
                    ToolTip = 'Specifies the value of the TaskFinished field.';
                }
            }
        }
    }

    trigger OnClosePage()
    begin
        CurrPage.Close();
    end;
}
