page 50100 ProjectsPage
{
    ApplicationArea = All;
    Caption = 'Projects';
    PageType = Card;
    SourceTable = Projects;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(ProjectID; Rec.ProjectID)
                {
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field(ProjectName; Rec.ProjectName)
                {
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(TotalTime; Rec.TotalTime)
                {
                    ToolTip = 'Specifies the value of the Total Time field.';
                }
                field(RemainingTime; Rec.RemainingTime)
                {
                    ToolTip = 'Specifies the value of the Remaining Time field.';
                }
            }
        }
    }
}
