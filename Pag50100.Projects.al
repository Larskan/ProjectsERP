page 50100 Projects
{
    ApplicationArea = All;
    Caption = 'Projects';
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Consultants';

                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the employee''s private email address.';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ToolTip = 'Specifies the employee''s job title.';
                }
                field("Manager No."; Rec."Manager No.")
                {
                    ToolTip = 'Specifies the value of the Manager No. field.';
                }
            }
        }
    }
}

