table 50112 ClosedProjects
{
    Caption = 'ClosedProjects';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CProjectID; Integer)
        {
            Caption = 'Closed Project ID';
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
