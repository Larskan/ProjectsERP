table 50125 Tasks
{
    Caption = 'Tasks';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; TaskID; Integer)
        {
            Caption = 'Task ID';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; ProjectID; Integer)
        {
            Caption = 'Project ID';
            DataClassification = ToBeClassified;
        }
        field(10; TaskName; Text[50])
        {
            Caption = 'Task Name';
            DataClassification = ToBeClassified;
        }
        field(20; Description; Text[1000])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(30; TotalTimeUsed; Text[50])
        {
            Caption = 'Total Time used in hours';
            DataClassification = ToBeClassified;
        }
        field(40; TaskPlanTime; Text[50])
        {
            Caption = 'Task Plan Time in hours';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; ProjectID, TaskID)
        {
            Clustered = true;
        }
    }
}
