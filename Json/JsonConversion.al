codeunit 50132 WebGet
{
    procedure Number(x: Integer; y: Integer) result: Integer
    begin
        result := x + y;
    end;

    procedure Login(username: Text; password: Text) returnJ: JsonObject
    var
        JEmpObject: JsonObject;
        FindEmploee: Record EmployeeTable;
    begin
        if FindEmploee.FindSet() then
            repeat
                if (FindEmploee.Username = username) and (FindEmploee.Password = password) then begin
                    JEmpObject.Add('EmpID', FindEmploee.EmpID);
                    JEmpObject.Add('Name', FindEmploee.FirstName);
                    JEmpObject.Add('Lastname', FindEmploee.LastName);
                    JEmpObject.Add('Email', FindEmploee.Email);
                    exit(JEmpObject);
                end;
            until FindEmploee.Next() = 0;
    end;
}


// codeunit 50131 webInsert
// {
//     procedure Number(x: Integer; y: Integer) result: Integer
//     begin
//         result := x + y;
//     end;
// }