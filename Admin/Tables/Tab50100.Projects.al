table 50100 Projects
{
    Caption = 'Projects';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ProjectID; Integer)
        {
            Caption = 'Project ID';
            DataClassification = ToBeClassified;
        }
        field(10; ProjectName; Text[50])
        {
            Caption = 'Project Name';
            DataClassification = ToBeClassified;
        }
        field(20; TotalTime; Text[50])
        {
            Caption = 'Total Time';
            DataClassification = ToBeClassified;
        }
        field(30; RemainingTime; Text[50])
        {
            Caption = 'Remaining Time';
            DataClassification = ToBeClassified;
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
