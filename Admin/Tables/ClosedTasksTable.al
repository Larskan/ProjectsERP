table 50122 ClosedTasks
{
    Caption = 'Closed Tasks';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CTaskID; Integer)
        {
            Caption = 'Closed Task ID';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; CProjectID; Integer)
        {
            Caption = 'Closed Project ID';
            DataClassification = ToBeClassified;
            TableRelation = ClosedProjects.CProjectID;
        }
        field(10; TaskName; Text[50])
        {
            Caption = 'Task Name';
            DataClassification = ToBeClassified;
        }
        field(20; TotalTimeUsed; Text[50])
        {
            Caption = 'Total Time used in hours';
            DataClassification = ToBeClassified;
        }
        field(30; TaskPlanTime; Text[50])
        {
            Caption = 'Task Plan Time in hours';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; CTaskID)
        {
            Clustered = true;
        }
    }
}
