codeunit 50111 NoSeriesSetup
{
    //Setup
    procedure InitSetup()
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
