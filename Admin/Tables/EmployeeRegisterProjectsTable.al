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
        }
        field(3; ProjectID; Integer)
        {
            Caption = 'Project ID';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; EmpID, ProjectID, ERPID)
        {
            Clustered = true;
        }
    }
}
