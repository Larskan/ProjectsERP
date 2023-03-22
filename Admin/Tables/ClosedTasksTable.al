table 50113 ClosedTasks
{
    Caption = 'Closed Tasks';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CTaskID; Integer)
        {
            Caption = 'Closed Task ID';
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
