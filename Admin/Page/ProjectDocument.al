page 50119 ProjectDocument
{
    ApplicationArea = All;
    Caption = 'ProjectDocument';
    PageType = Document;
    SourceTable = Projects;
    DeleteAllowed = false;

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
                field(timeUsed; Rec.timeUsed)
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
                    Editable = false;
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
                    AdminTaskCode: Codeunit AdminTaskCode;
                begin
                    AdminTaskCode.TaskCardPage(rec.ProjectID);
                end;
            }
            action(EditTask)
            {
                Caption = 'Edit Task';
                ApplicationArea = All;

                trigger OnAction()
                var
                    Task: Record TasksTable;
                    selectTaskCodeUnite: Codeunit AdminTaskCode;
                begin
                    CurrPage.TaskPage.Page.SetSelectionFilter(Task);
                    selectTaskCodeUnite.SelectTask(Task);
                end;
            }
            action(addEmployee)
            {
                Caption = 'Add Employee';
                ApplicationArea = All;

                trigger OnAction()
                var
                    myint: Integer;
                begin

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