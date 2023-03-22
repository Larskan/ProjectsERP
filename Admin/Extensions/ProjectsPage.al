page 50110 ProjectsPage
{
    ApplicationArea = All;
    Caption = 'Projects';
    PageType = Card;
    SourceTable = Projects;

    //test push

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(ProjectID; Rec.ProjectID)
                {
                    Caption = 'Project ID';
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field(ProjectName; Rec.ProjectName)
                {
                    Caption = 'Project Name';
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(TotalTime; Rec.TotalTime)
                {
                    Caption = 'Total Time in hours';
                    ToolTip = 'Specifies the value of the Total Time field.';
                }
                field(RemainingTime; Rec.RemainingTime)
                {
                    Caption = 'Remaining Time in hours';
                    ToolTip = 'Specifies the value of the Remaining Time field.';
                }
            }
        }
    }
}
