page 50117 EmployeeERPCard
{
    ApplicationArea = All;
    Caption = 'EmployeeERP Card';
    PageType = Card;
    SourceTable = EmployeeTable;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(EmpID; Rec.EmpID)
                {
                    Caption = 'Employee ID';
                    ToolTip = 'Specifies the value of the EmpID field.';
                }
                field(FirstName; Rec.FirstName)
                {
                    Caption = 'First Name';
                    ToolTip = 'Specifies the value of the FirstName field.';
                }
                field(LastName; Rec.LastName)
                {
                    Caption = 'Last Name';
                    ToolTip = 'Specifies the value of the LastName field.';
                }
                field(Email; Rec.Email)
                {
                    Caption = 'E-Mail';
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Username; Rec.Username)
                {
                    Caption = 'Username';
                    ToolTip = 'Specifies the value of the Username field.';
                }
                field(Password; Rec.Password)
                {
                    Caption = 'Password';
                    ToolTip = 'Specifies the value of the Password field.';
                }
            }
        }


    }

    actions
    {
        area(Promoted)
        {
            group(Category_Category1)
            {
                Caption = 'Insert new Employee', Comment = 'Generated from the PromotedActionCategories property index 3.';


            }
        }


        area(Processing)
        {

        }

        area(Navigation)
        {
            action("Setup Series Number")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    SeriesSetup: Codeunit 50111;
                begin
                    SeriesSetup.CreateNoSeries();
                end;
            }

            action("Dummy Data")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Dummy: Codeunit 50114;
                    Dummy2: Codeunit 50115;
                begin
                    Dummy.GenerateEmployees();
                    Dummy2.GenerateProjects();
                end;
            }

            group(Projects)
            {
                action("View Current Groups")
                {
                    trigger OnAction()
                    begin

                    end;
                }
            }
        }
    }
}
