table 50104 EmployeeRegisterProjects
{
    Caption = 'EmployeeRegisterProjects';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ERPID; Integer)
        {
            Caption = 'ERPID';
            DataClassification = ToBeClassified;
        }
        field(2; EmpID; Integer)
        {
            Caption = 'EmpID';
            DataClassification = ToBeClassified;
        }
        field(3; ProjectID; Integer)
        {
            Caption = 'ProjectID';
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
    }
}
