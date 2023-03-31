pageextension 50130 ExtendNavigationArea extends "Order Processor Role Center"
{
    //Easy access on the Website
    actions
    {
        addlast(sections)
        {
            group("ERP Admin")
            {
                action("Project Document")
                {
                    RunObject = page ProjectDocument;
                    ApplicationArea = All;
                }
                action("Task")
                {
                    RunObject = page TaskPage;
                    ApplicationArea = All;
                }
                action("Project")
                {
                    RunObject = page ProjectPage;
                    ApplicationArea = All;
                }
                action("Employee Card for ERP")
                {
                    RunObject = page EmployeeERPCard;
                    ApplicationArea = All;
                }
            }
        }
    }
}