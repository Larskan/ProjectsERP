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
