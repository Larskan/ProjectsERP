page 50101 TaskPageCard
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
                Caption = 'General';
                
                field(TaskName; Rec.TaskName)
                {
                    ToolTip = 'Specifies the value of the TaskName field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(TaskPlanTime; Rec.TaskPlanTime)
                {
                    ToolTip = 'Specifies the value of the TaskPlanTime field.';
                }
            }
        }
    }
}
