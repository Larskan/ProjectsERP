pageextension 50118 EmployeeExt extends "Employee Card"
{
    //For changing layout in employee card, adding options to register hours
    layout
    {
        addlast(General)
        {
            field("No Series"; Rec."No. Series")
            {
                ApplicationArea = All;
                //Lookup: Lookup window for a text box, true: lookup is needed
                Lookup = true;
            }
        }
    }

    actions
    {
        addlast(navigation)
        {
            action("Series")
            {
                ApplicationArea = All;
                RunObject = page "No. Series";
            }
        }
    }
}
