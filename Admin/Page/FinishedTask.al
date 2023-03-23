page 50104 FinishedTask
{
    ApplicationArea = All;
    Caption = 'FinishedProject';
    PageType = List;
    SourceTable = ClosedTasks;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(TaskName; Rec.TaskName)
                {
                    ToolTip = 'Specifies the value of the Task Name field.';
                }
                field(TaskPlanTime; Rec.TaskPlanTime)
                {
                    ToolTip = 'Specifies the value of the Task Plan Time in hours field.';
                }
                field(TotalTimeUsed; Rec.TotalTimeUsed)
                {
                    ToolTip = 'Specifies the value of the Total Time used in hours field.';
                }
            }
        }
    }
}
