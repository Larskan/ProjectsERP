table 50114 EmployeeRegisterProjects
{
    Caption = 'Employee Registered Projects';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ERPID; Integer)
        {
            Caption = 'ERP ID';
            DataClassification = ToBeClassified;
        }
        field(2; EmpID; Integer)
        {
            Caption = 'Emp ID';
            DataClassification = ToBeClassified;
            TableRelation = EmployeeTable.EmpID;
        }
        field(3; ProjectID; Integer)
        {
            Caption = 'Project ID';
            DataClassification = ToBeClassified;
            TableRelation = ProjectTable.ProjectID;
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
