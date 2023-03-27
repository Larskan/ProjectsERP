table 50123 EmployeeRegisterProjects
{
    Caption = 'Employee Registered Projects';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ERPID; Integer)
        {
            Caption = 'ERP ID';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; EmpID; Integer)
        {
            Caption = 'Emp ID';
            DataClassification = ToBeClassified;
            TableRelation = EmployeeTable.EmpID;//Foreign Key Relation
        }
        field(3; ProjectID; Integer)
        {
            Caption = 'Project ID';
            DataClassification = ToBeClassified;
            TableRelation = ProjectTable.ProjectID;//Foreign Key Relation
        }
    }
    keys
    {
        key(PK; ERPID)
        {
            Clustered = true;
        }
    }
}
