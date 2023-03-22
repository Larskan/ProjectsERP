table 50120 SeriesSetup
{
    Caption = 'Series Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(10; "Export Path"; Text[200])
        {
            Caption = 'Export Path';
            DataClassification = ToBeClassified;
        }
        field(20; "Export File Name"; Text[200])
        {
            Caption = 'Export File Name';
            DataClassification = ToBeClassified;
        }
        field(21; "Setup Nos"; Code[20])
        {
            Caption = 'Setup Nos';
            TableRelation = "No. Series";
            DataClassification = AccountData;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
