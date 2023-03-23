page 50103 TaskPage
{
    ApplicationArea = All;
    Caption = 'TaskPage';
    PageType = List;
    SourceTable = Tasks;
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(TaskName; Rec.TaskName)
                {
                    ToolTip = 'Specifies the value of the TaskName field.';
                }
                field(TaskPlanTime; Rec.TaskPlanTime)
                {
                    ToolTip = 'Specifies the value of the TaskPlanTime field.';
                }
                field(TotalTimeUsed; Rec.TotalTimeUsed)
                {
                    ToolTip = 'Specifies the value of the TotalTimeUsed field.';
                }
            }
        }
    }
}
