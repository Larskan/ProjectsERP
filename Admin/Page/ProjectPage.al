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
            }
        }
    }
}
