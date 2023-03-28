table 50125 TasksTable
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
            TableRelation = Projects.ProjectID; //Foreign Key Relation
        }
        field(3; EmpID; Integer)
        {
            Caption = 'Emp ID';
            DataClassification = ToBeClassified;
            TableRelation = EmployeeTable.EmpID; //Foreign Key Relation
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
        field(30; TotalTimeUsed; Integer)
        {
            Caption = 'Total Time used in hours';
            DataClassification = ToBeClassified;
        }
        field(40; TaskPlanTime; Integer)
        {
            Caption = 'Task Plan Time in hours';
            DataClassification = ToBeClassified;
        }
        field(50; TaskFinished; Boolean)
        {
            Caption = 'Task Marked Finished';
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
