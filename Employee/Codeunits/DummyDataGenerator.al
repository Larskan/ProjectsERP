//This is some really bad dummy data, but it works
codeunit 50114 DummyDataGenerator
{
    TableNo = EmployeeTable;

    procedure GenerateEmployees()
    var
        Employee: Record EmployeeTable;
        i: Integer;
        EmployeeFirstName: Text;
        EmployeeLastName: Text;
        EmployeeEmail: Text;
        EmployeeUsername: Text;
    begin
        for i := 1 to 5 do begin
            Employee.EmpID := i;
            EmployeeFirstName := FORMAT('EmployeeFirstName%d', i);
            EmployeeLastName := FORMAT('EmployeeLastName%d', i);
            EmployeeEmail := FORMAT('Employee%d@example.com', i);
            EmployeeUsername := FORMAT('Emp%d', i);
            Employee.Password := '123';

            Employee.FirstName := EmployeeFirstName;
            Employee.LastName := EmployeeLastName;
            Employee.Email := EmployeeEmail;
            Employee.Username := EmployeeUsername;

            Employee.Insert;
        end;
    end;


}
