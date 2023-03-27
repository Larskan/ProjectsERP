table 50124 Projects
{
    Caption = 'Projects';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ProjectID; Integer)
        {
            Caption = 'Project ID';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(10; ProjectName; Text[50])
        {
            Caption = 'Project Name';
            DataClassification = ToBeClassified;
        }
        field(20; TotalTime; Text[50])
        {
            Caption = 'Total Time in hours';
            DataClassification = ToBeClassified;
        }
        field(30; RemainingTime; Text[50])
        {
            Caption = 'Remaining Time in hours';
            DataClassification = ToBeClassified;
        }
        field(40; Locked; Boolean)
        {
            Caption = 'Locked';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; ProjectID)
        {
            Clustered = true;
        }
    }
}
