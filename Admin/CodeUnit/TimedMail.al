codeunit 50125 TimedMail
{
    TableNo = Projects;
    procedure SendMails(var projectId: Integer)

    var
        Projects: Record Projects;
        TempEmailItem: Record "Email Item" temporary;
        BodyText: Text;
        countAmount: Integer;
    begin


        if Projects.timeUsed > Projects.TotalTime then begin
            if Projects.FindSet() then
                repeat
                    countAmount += 1;
                    if countAmount = 1 then begin
                        Projects.FindFirst();

                    end;
                until Projects.Next() = 0;
        end;

    end;




}
