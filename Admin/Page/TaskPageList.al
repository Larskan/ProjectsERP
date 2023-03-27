page 50124 TaskPage
{
    ApplicationArea = All;
    Caption = 'TaskPage';
    PageType = ListPart;
    SourceTable = Tasks;
    Editable = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(TaskName; Rec.TaskName)
                {
                    ToolTip = 'Specifies the value of the TaskName field.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    Editable = false;
                }
                field(TaskPlanTime; Rec.TaskPlanTime)
                {
                    ToolTip = 'Specifies the value of the TaskPlanTime field.';
                    Editable = false;
                }
                field(TotalTimeUsed; Rec.TotalTimeUsed)
                {
                    ToolTip = 'Specifies the value of the TotalTimeUsed field.';
                    Editable = false;
                }
            }
        }
    }
}
