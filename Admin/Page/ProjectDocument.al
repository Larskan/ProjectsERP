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
                field(ProjectDone; Rec.ProjectDone)
                {
                    ToolTip = 'Specifies the value of the ProjectDone field.';
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
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    AdminTaskCode: Codeunit AdminTaskCode;
                    asd: Page "Sales Order";
                begin
                    if rec.ProjectDone = False then begin
                        AdminTaskCode.TaskCardPage(rec.ProjectID);
                    end
                    else begin
                        Message('Project Is Marked Done, So No Edits');
                    end;
                end;
            }
            action(EditTask)
            {
                Caption = 'Edit Task';
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Task: Record TasksTable;
                    selectTaskCodeUnite: Codeunit AdminTaskCode;
                begin
                    if rec.ProjectDone = False then begin
                        CurrPage.TaskPage.Page.SetSelectionFilter(Task);
                        selectTaskCodeUnite.SelectTask(Task);
                    end
                    else begin
                        Message('Project Is Marked Done, So No Edits');
                    end;
                end;
            }
            action(addEmployee)
            {
                Caption = 'Add Employee';
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    OpenEmp: Codeunit AdminTaskCode;
                    Task: Record TasksTable;
                begin
                    if rec.ProjectDone = False then begin
                        CurrPage.TaskPage.Page.SetSelectionFilter(Task);
                        OpenEmp.OpenEmpDoc(Task);
                    end
                    else begin
                        Message('Project Is Marked Done, So No Edits');
                    end;
                end;
            }
            action(MarkProjectDone)
            {
                Caption = 'Mark Project Done';
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    confirmMgmt: Codeunit "Confirm Management";
                    AdminTaskCode: Codeunit AdminTaskCode;
                begin
                    if rec.ProjectDone = False then begin
                        if confirmMgmt.GetResponseOrDefault('Confirm project done', true) then begin
                            CurrPage.Editable := false;
                            rec.ProjectDone := true;
                            Message('Project marked done');
                            CurrPage.Update();
                            AdminTaskCode.MarkTaskDone(rec.ProjectID);
                        end
                        else
                            Message('Project not alterd')
                    end
                    else begin
                        Message('Project Is Marked Done, So No Edits');
                    end;
                end;
            }
            action(test)
            {
                Caption = 'Add Employee';
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    WebGet: Codeunit WebGet;
                begin
                    WebGet.GetProjectTask(1);
                end;
            }
        }
    }
}