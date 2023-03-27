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
                Caption = 'General';
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
                field(TaskFinished; Rec.TaskFinished)
                {
                    ToolTip = 'Specifies the value of the TaskFinished field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    MultiLine = true;
                    Width = 200;
                }
            }
        }
    }
}
