table 50116 Tasks
{
    Caption = 'Tasks';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; TaskID; Integer)
        {
            Caption = 'TaskID';
            DataClassification = ToBeClassified;
        }
        field(2; ProjectID; Integer)
        {
            Caption = 'ProjectID';
            DataClassification = ToBeClassified;
        }
        field(10; TaskName; Text[50])
        {
            Caption = 'TaskName';
            DataClassification = ToBeClassified;
        }
        field(20; TotalTimeUsed; Text[50])
        {
            Caption = 'TotalTimeUsed';
            DataClassification = ToBeClassified;
        }
        field(30; TaskPlanTime; Text[50])
        {
            Caption = 'TaskPlanTime';
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
