table 50116 Tasks
{
    Caption = 'Tasks';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; TaskID; Integer)
        {
            Caption = 'Task ID';
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
        key(PK; TaskID)
        {
            Clustered = true;
        }
        key(FK1; ProjectID)
        {
            //ProjectID FK
            //IncludedFields = ProjectID;
        }
    }
}
