table 50116 TasksTable
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
        field(2; ProjectID; Code[20])
        {
            Caption = 'Project ID';
            DataClassification = ToBeClassified;
            TableRelation = ProjectTable.ProjectID;
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
    }
}
