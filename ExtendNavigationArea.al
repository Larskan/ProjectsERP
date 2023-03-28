pageextension 50130 ExtendNavigationArea extends "Order Processor Role Center"
{
    //Easy access on the Website
    actions
    {
        addlast(sections)
        {
            group("ProjectsERP")
            {
                action("Employee Card")
                {
                    RunObject = page "Employee Card";
                    ApplicationArea = All;
                }
                action("Employee ERP Card")
                {
                    RunObject = page EmployeeERPCard;
                    ApplicationArea = All;
                }
                action("No. Series")
                {
                    RunObject = page "No. Series";
                    ApplicationArea = All;
                }

            }
            group("ProjectsERPAdmin")
            {
                action("ProjectDecument")
                {
                    RunObject = page ProjectDocument;
                    ApplicationArea = All;
                }
            }
        }
    }
}