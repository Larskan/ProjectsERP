page 50117 EmployeeERPCard
{
    ApplicationArea = All;
    Caption = 'EmployeeERP Card';
    PageType = Card;
    SourceTable = EmployeeTable;

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
}
