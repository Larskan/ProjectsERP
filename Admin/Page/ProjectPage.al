page 50123 ProjectPage
{
    ApplicationArea = All;
    Caption = 'ProjectPage';
    PageType = Card;
    SourceTable = ProjectTable;

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
                    ToolTip = 'Specifies the value of the TotalTime field.';
                    Editable = false;
                }
                field(RemainingTime; Rec.RemainingTime)
                {
                    ToolTip = 'Specifies the value of the RemainingTime field.';
                    Editable = false;
                }
            }
        }
    }
}
