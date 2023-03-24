page 50123 ProjectPage
{
    ApplicationArea = All;
    Caption = 'ProjectPage';
    PageType = Card;
    SourceTable = Projects;

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
                    ToolTip = 'Specifies the value of the Total Time field.';
                    Editable = false;
                }
                field(RemainingTime; Rec.RemainingTime)
                {
                    ToolTip = 'Specifies the value of the Remaining Time field.';
                    Editable = false;
                }
            }
        }
    }
}
