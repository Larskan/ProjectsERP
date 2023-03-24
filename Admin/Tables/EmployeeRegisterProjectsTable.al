table 50123 EmployeeRegisterProjects
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
        }
        field(3; ProjectID; Integer)
        {
            Caption = 'Project ID';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; ERPID)
        {
            //Foreign key EmpID and ProjectID
            Clustered = true;
        }
        key(FK1; EmpID)
        {
            //Employee ID FK
        }
        key(FK2; ProjectID)
        {
            //Project ID FK
        }
    }
}
