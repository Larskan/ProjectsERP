page 50111 TasksPage
{
    ApplicationArea = All;
    Caption = 'TasksPage';
    PageType = Card;
    SourceTable = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(TaskID; Rec.TaskID)
                {
                    ToolTip = 'Specifies the value of the TaskID field.';
                }
                field(ProjectID; Rec.ProjectID)
                {
                    ToolTip = 'Specifies the value of the ProjectID field.';
                }
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
