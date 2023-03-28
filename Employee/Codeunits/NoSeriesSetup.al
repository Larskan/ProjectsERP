codeunit 50111 NoSeriesSetup
{
    //Setup
    procedure CreateNoSeries(SeriesID: Integer)
    var
        NoSeriesSetup: Record SeriesSetup;
        NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";
    begin
        NoSerie.Init;

        NoSerie.Code := 'SeriesERP';
        NoSerie.Description := 'No. Series for ERP Projects';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;
        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SeriesERP0000';
        NoSerieLine."Ending No." := 'SeriesERP9000';
        if NoSerieLine.Insert then;
        NoSeriesSetup."Setup Nos" := NoSerie.Code;
        NoSeriesSetup.Modify();

        if NoSerie.Get(SeriesID) then begin
            //NoSerie. += 1;
            NoSerie.Modify();
        end;
    end;

    local procedure Fix()
    var
        SeriesSetup: Record SeriesSetup;
    begin
        SeriesSetup.Get();
        SeriesSetup."Setup Nos" := 'SeriesERP';
        SeriesSetup.Modify();
    end;

    var
        SetupExists: Boolean;
}

codeunit 50112 EmpToTask
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