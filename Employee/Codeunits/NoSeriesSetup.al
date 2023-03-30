codeunit 50111 NoSeriesSetup
{
    //Setup
    local procedure Fix()
    var
        SeriesSetup: Record SeriesSetup;
    begin
        SeriesSetup.Get();
        SeriesSetup."Setup Nos" := 'EmployeeSeriesERP';
        SeriesSetup.Modify();
    end;

    var
        SetupExists: Boolean;
}

codeunit 50112 NoSeriesEmployee
{
    procedure CreateEmployeeNoSeries()
    var
        NoSeriesEmployee: Record SeriesSetup;
        NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";
    begin
        NoSeriesEmployee.Init;

        NoSerie.Code := 'EmployeeSeriesERP';
        NoSerie.Description := 'No. Series for ERP Employees';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;
        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SeriesERP0100';
        NoSerieLine."Ending No." := 'SeriesERP9000';
        NoSerieLine."Last No. Used" := 'SeriesERP0100';
        if NoSerieLine.Insert then;
        NoSeriesEmployee."Setup Nos" := NoSerie.Code;
        NoSeriesEmployee.Modify();

    end;
}


codeunit 50117 EmpToTask
{
    procedure addEmpToTask(var EmployeeTable: Record EmployeeTable; var TasksTable: Record TasksTable) result: Boolean
    var
        countAmount: Integer;
        taksTable: Record TasksTable;
        RecRef: RecordRef;
        taskIdText: Text;
    begin
        if EmployeeTable.FindSet() then
            repeat
                countAmount += 1;
            until EmployeeTable.Next() = 0;
        if countAmount = 1 then begin
            EmployeeTable.FindFirst();
            TasksTable.EmpID := EmployeeTable.EmpID;
            TasksTable.empAdded := true;
            TasksTable.Modify();
            result := true;
        end
        else begin
            result := false;
        end;
    end;
}