page 50111 TasksPage
{
    ApplicationArea = All;
    Caption = 'TasksPage';
    PageType = Card;
    SourceTable = TasksTable;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(TaskID; Rec.TaskID)
                {
                    Caption = 'Task ID';
                    ToolTip = 'Specifies the value of the TaskID field.';
                }
                field(ProjectID; Rec.ProjectID)
                {
                    Caption = 'Project ID';
                    ToolTip = 'Specifies the value of the ProjectID field.';
                }
                field(TaskName; Rec.TaskName)
                {
                    Caption = 'Task Name';
                    ToolTip = 'Specifies the value of the TaskName field.';
                }
                field(TaskPlanTime; Rec.TaskPlanTime)
                {
                    Caption = 'Task Plan Time in hours';
                    ToolTip = 'Specifies the value of the TaskPlanTime field.';
                }
                field(TotalTimeUsed; Rec.TotalTimeUsed)
                {
                    Caption = 'Total Time Used in hours';
                    ToolTip = 'Specifies the value of the TotalTimeUsed field.';
                }
            }
        }
    }
}
