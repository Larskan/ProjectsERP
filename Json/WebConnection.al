codeunit 50132 WebGet
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
    begin
        Username := Username.Trim();
        Password := Password.Trim();
        EmpRec.SetFilter(Username, Username);
        EmpRec.SetFilter(Password, Password);
        if not EmpRec.IsEmpty and not (Username = '') and not (Password = '') then begin
            EmpRec.FindFirst();
            JEmp.Add('EmpID', EmpRec.EmpID);
            JEmp.Add('FirstName', EmpRec.FirstName);
            JEmp.Add('LastName', EmpRec.LastName);
            JEmp.Add('Boolean', true);

<<<<<<< HEAD
        if not EmpRec.IsEmpty then begin
            EmpRec.FindFirst();
            JEmp.Add('EmpID', EmpRec.EmpID);
            JEmp.Add('FirstName', EmpRec.FirstName);
            JEmp.Add('LastName', EmpRec.LastName);
            JEmp.Add('Boolean', true);
=======
>>>>>>> 579f4e5cc0d832146d4400151590e25e653b491b
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