page 50127 EmployeeTaskList
{
    ApplicationArea = All;
    Caption = 'EmployeeTaskList';
    PageType = List;
    SourceTable = EmployeeTable;
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
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
            }
        }
    }
}
