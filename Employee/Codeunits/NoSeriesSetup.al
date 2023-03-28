codeunit 50111 NoSeriesSetup
{
    //Setup
    procedure CreateNoSeries()
    var
        NoSeriesSetup: Record SeriesSetup;
        NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";
    begin
        NoSeriesSetup.Init;

        NoSerie.Code := 'SeriesERP';
        NoSerie.Description := 'No. Series for ERP Projects';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;
        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SeriesERP0000';
        NoSerieLine."Ending No." := 'SeriesERP9000';
        NoSerieLine."Last No. Used" := 'SeriesERP0001';
        if NoSerieLine.Insert then;
        NoSeriesSetup."Setup Nos" := NoSerie.Code;
        NoSeriesSetup.Modify();

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
        NoSerieLine."Starting No." := 'SeriesERP1000';
        NoSerieLine."Ending No." := 'SeriesERP9000';
        NoSerieLine."Last No. Used" := 'SeriesERP1001';
        if NoSerieLine.Insert then;
        NoSeriesEmployee."Setup Nos" := NoSerie.Code;
        NoSeriesEmployee.Modify();

    end;
}

codeunit 50113 NoSeriesTasks
{
    procedure CreateEmployeeNoSeries()
    var
        NoSeriesTasks: Record SeriesSetup;
        NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";
    begin
        NoSeriesTasks.Init;

        NoSerie.Code := 'EmployeeSeriesERP';
        NoSerie.Description := 'No. Series for ERP Employees';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;
        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SeriesERP2000';
        NoSerieLine."Ending No." := 'SeriesERP9000';
        NoSerieLine."Last No. Used" := 'SeriesERP2001';
        if NoSerieLine.Insert then;
        NoSeriesTasks."Setup Nos" := NoSerie.Code;
        NoSeriesTasks.Modify();

    end;
}
