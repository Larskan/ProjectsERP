table 50121 ClosedProjects
{
    Caption = 'ClosedProjects';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CProjectID; Integer)
        {
            Caption = 'Closed Project ID';
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
    }
    keys
    {
        key(PK; CProjectID)
        {
            Clustered = true;
        }
    }
}
