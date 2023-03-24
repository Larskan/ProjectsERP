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
    actions
    {
        area(Processing)
        {
            action(AddNewTask)
            {
                Caption = 'New Task';
                ApplicationArea = All;

                trigger OnAction()
                var
                    taskCard: Page "Task Card";
                begin
                    taskCard.Run();
                end;
            }
            action(ProjectDone)
            {
                Caption = 'Mark Project Done';
                ApplicationArea = All;

                trigger OnAction()
                var
                    confirmMgmt: Codeunit "Confirm Management";
                begin
                    if confirmMgmt.GetResponseOrDefault('Confirm project done', true) then
                        Message('done')
                    else
                        Message('Not done')
                end;
            }
        }
    }
}