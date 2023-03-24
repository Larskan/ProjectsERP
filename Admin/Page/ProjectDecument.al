page 50122 ProjectDecument
{
    ApplicationArea = All;
    Caption = 'ProjectDecument';
    PageType = Document;
    SourceTable = Projects;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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
            group("Task Page")
            {
                part(TaskPage; 50124)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    Enabled = true;
                    SubPageLink = ProjectID = field(ProjectID);
                    UpdatePropagation = Both;
                }
            }
        }
    }
}