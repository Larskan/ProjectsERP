table 50103 ClosedTasks
{
    Caption = 'ClosedTasks';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CTaskID; Integer)
        {
            Caption = 'CTaskID';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; CTaskID)
        {
            //Foreign key?
            Clustered = true;
        }
    }
}
