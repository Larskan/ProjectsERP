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
                    //Changes made to subpage, is reflected in the parent page and vice versa
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
                    //Checks if project related to the task is marked as done
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
                    //Checks if ProjectDone field is false
                    //If false: Confirm box to user
                    //If user clicks OK to confirm: Editable becomes False and sets ProjectDone field to true and display message and updates page and runs MarkTaskDOne
                    //MarkTaskDone is a codeunit that marks all tasks associated with the current project as done
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

            action(SendMailByMidnight)
            {
                Caption = 'Send Email';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    ProjectTable: Record Projects;
                    Email: Codeunit Email;
                    EmailMessage: Codeunit "Email Message";
                    MailTime: Codeunit TimedMail;
                    AttachmentInStream: InStream;
                    ImportCvsfile: File;
                    Body: Text;
                    MailMessage: Text;
                    Receiver: Text;
                begin
                    if ProjectTable.timeUsed > ProjectTable.TotalTime then begin
                        Receiver := 'heinotestmail@gmail.com';
                        Body := 'The projects that went over deadline time';
                        Message(ProjectTable.ProjectName);
                        EmailMessage.Create(Receiver, Body, MailMessage);

                        //ImportCvsfile.Open()
                        //ImportCsvFile.CreateInStream(AttachmentInStream);

                        EmailMessage.AddAttachment('', '', AttachmentInStream);
                        Email.Send(emailMessage, "Email Scenario"::"Send Email");
                        //ImportCvsfile.Close();
                    end
                    else begin
                        Message('No projects went over time');
                    end;


                end;
            }
        }
    }
}