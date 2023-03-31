codeunit 50125 TimedMail
{

    procedure SendProjectEmails()
    var
        ProjectTable: Record Projects;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Subject: Text;
        Body: Text;
        Receiver: Text;
        cr: Char;
    begin
        Receiver := 'rogengell@hotmail.com';

        Subject := 'Project Over Deadline';

        Body := '';

        cr := 13;

        if ProjectTable.FindSet() then
            repeat
                ProjectTable.CalcFields(TotalTime, timeUsed);
                if ProjectTable.timeUsed > ProjectTable.TotalTime then begin
                    Body += 'Project Name: ' + ProjectTable.ProjectName + Format(cr);
                    Body += 'Total Time Given: ' + Format(ProjectTable.TotalTime) + Format(cr);
                    Body += 'Total Time Used' + Format(ProjectTable.timeUsed) + Format(cr);
                    Body += Format(cr);
                end;
            until ProjectTable.Next() = 0;

        if not (Body = '') then begin
            EmailMessage.Create(Receiver, Subject, Body);
            Email.Send(EmailMessage, "Email Scenario"::"SendEmails");
        end;

    end;
}
