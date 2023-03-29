codeunit 50130 WebGet
{
    procedure Number(x: Integer; y: Integer) result: Integer
    begin
        result := x + y;
    end;

    procedure Login(Username: Text; Password: Text) result: Text;
    var
        EmpRec: Record EmployeeTable;
        temp: HttpResponseMessage;
        JEmp: JsonObject;
        ok: Boolean;
        varone: Text;
    begin
        EmpRec.SetFilter(Username, Username);
        EmpRec.SetFilter(Password, Password);
        ok := Evaluate(varone, Username);
        if not EmpRec.IsEmpty and not (Username.Contains(' ')) and not (Password.Contains(' ')) and not (Username = '') and not (Password = '') then begin
            EmpRec.FindFirst();
            JEmp.Add('EmpID', EmpRec.EmpID);
            JEmp.Add('FirstName', EmpRec.FirstName);
            JEmp.Add('LastName', EmpRec.LastName);
            JEmp.Add('Boolean', true);

        end
        else begin
            JEmp.Add('EmpID', '');
            JEmp.Add('FirstName', '');
            JEmp.Add('LastName', '');
            JEmp.Add('Boolean', false);
        end;

        JEmp.WriteTo(result);
    end;
}


codeunit 50131 webInsert
{
    procedure Number(x: Integer; y: Integer) result: Integer
    begin
        result := x + y;
    end;
}