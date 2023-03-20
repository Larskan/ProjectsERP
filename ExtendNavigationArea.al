pageextension 50120 ExtendNavigationArea extends "Order Processor Role Center"
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
                action("Projects")
                {
                    RunObject = page Projects;
                    ApplicationArea = All;
                }

            }
        }
    }
}