table 50124 Projects
{
    Caption = 'Projects';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ProjectID; Integer)
        {
            Caption = 'Project ID';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(10; ProjectName; Text[50])
        {
            Caption = 'Project Name';
            DataClassification = ToBeClassified;
        }
        field(20; TotalTime; Integer)
        {
            Caption = 'Total Time in hours';
            FieldClass = FlowField;
            CalcFormula = sum(TasksTable.TaskPlanTime where(ProjectID = field(ProjectID)));
        }
        field(30; timeUsed; Integer)
        {
            Caption = 'Time used in minitues';
            FieldClass = FlowField;
            CalcFormula = sum(TasksTable.TotalTimeUsed where(ProjectID = field(ProjectID)));
        }
    }
    keys
    {
        key(PK; ProjectID)
        {
            Clustered = true;
        }
    }



}
