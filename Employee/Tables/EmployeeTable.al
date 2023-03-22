table 50119 EmployeeTable
{
    Caption = 'EmployeeTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EmpID; Integer)
        {
            Caption = 'EmpID';
            DataClassification = ToBeClassified;
        }
        field(10; FirstName; Text[50])
        {
            Caption = 'FirstName';
            DataClassification = ToBeClassified;
        }
        field(20; LastName; Text[50])
        {
            Caption = 'LastName';
            DataClassification = ToBeClassified;
        }
        field(30; Email; Text[50])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
        }
        field(40; Username; Text[50])
        {
            Caption = 'Username';
            DataClassification = ToBeClassified;
        }
        field(50; Password; Text[50])
        {
            Caption = 'Password';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; EmpID)
        {
            Clustered = true;
        }
    }
}
