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
                //Normally: Display Source Table, but we dont wanna show Record
            }
            group("Employee Page")
            {
                part(EmployeePage; 50127)
                {
                    //Show Employee Page with all data of Employees
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
                    addEmpToTask: Codeunit 50117;
                    result: Boolean;
                begin
                    //Filter which employee is selected from Employee Table
                    CurrPage.EmployeePage.Page.SetSelectionFilter(EmployeeTable);
                    //Call codeunit to add employee to task, with params Employee Selected and current page record(TaskTable)
                    result := addEmpToTask.addEmpToTask(EmployeeTable, rec);
                    //Check if made or not
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
