page 50126 EmployeeTaskDocument
{
    ApplicationArea = All;
    Caption = 'EmployeeTaskList';
    PageType = Document;
    SourceTable = TasksTable;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(TaskID; Rec.TaskID)
                {

                }
            }
            group("Employee Page")
            {
                part(EmployeePage; 50127)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Enabled = true;
                    UpdatePropagation = Both;
                }
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action(AddEmployee)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    EmployeeTable: Record EmployeeTable;
                    addEmpToTask: Codeunit 50112;
                    result: Boolean;
                begin
                    CurrPage.EmployeePage.Page.SetSelectionFilter(EmployeeTable);
                    result := addEmpToTask.addEmpToTask(EmployeeTable, rec);
                    if result then begin
                        Message('Employee Added');
                        CurrPage.Close();
                    end
                    else begin
                        Message('Somthing went wrong');
                    end;
                end;
            }
        }
    }
}
