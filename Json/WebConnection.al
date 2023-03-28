codeunit 50130 WebGet
{
    procedure Number(x: Integer; y: Integer) result: Integer
    begin
        result := x + y;
    end;

    procedure Login(Username: Text; Password: Text) result: JsonObject
    var
        EmpRec: Record EmployeeTable;
        JEmp: JsonObject;
    begin
        EmpRec.SetFilter(Username, Username);
        EmpRec.SetFilter(Password, Password);

        if not EmpRec.IsEmpty then
            repeat
                JEmp.Add('EmpID', EmpRec.EmpID);
                JEmp.Add('FirstName', EmpRec.FirstName);
                JEmp.Add('LastName', EmpRec.LastName);
                JEmp.Add('Boolean', true);
            until EmpRec.Next() = 0
        else begin
            JEmp.Add('EmpID', '');
            JEmp.Add('FirstName', '');
            JEmp.Add('LastName', '');
            JEmp.Add('Boolean', false);
        end;
        result := JEmp;
    end;
}


codeunit 50131 webInsert
{
    procedure Number(x: Integer; y: Integer) result: Integer
    begin
        result := x + y;
    end;
}