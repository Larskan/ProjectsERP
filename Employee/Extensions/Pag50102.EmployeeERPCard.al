page 50102 EmployeeERPCard
{
    ApplicationArea = All;
    Caption = 'EmployeeERPCard';
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
                    ToolTip = 'Specifies the value of the EmpID field.';
                }
                field(FirstName; Rec.FirstName)
                {
                    ToolTip = 'Specifies the value of the FirstName field.';
                }
                field(LastName; Rec.LastName)
                {
                    ToolTip = 'Specifies the value of the LastName field.';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Username; Rec.Username)
                {
                    ToolTip = 'Specifies the value of the Username field.';
                }
                field(Password; Rec.Password)
                {
                    ToolTip = 'Specifies the value of the Password field.';
                }
            }
        }
    }
}
