table 50112 ClosedProjects
{
    Caption = 'ClosedProjects';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CProjectID; Integer)
        {
            Caption = 'CProjectID';
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
