page 50120 FinishedProject
{
    ApplicationArea = All;
    Caption = 'FinishedProject';
    PageType = List;
    SourceTable = ClosedProjects;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ProjectName; Rec.ProjectName)
                {
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(TotalTime; Rec.TotalTime)
                {
                    ToolTip = 'Specifies the value of the Total Time in hours field.';
                }
                field(RemainingTime; Rec.RemainingTime)
                {
                    ToolTip = 'Specifies the value of the Remaining Time in hours field.';
                }
            }
        }
    }
}
