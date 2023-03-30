codeunit 50125 TimedMail
{

    procedure SendProjectEmails()
    var
        ProjectTable: Record Projects;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Subject: Text;
        Body: Text;
        Reciver: Text;
    begin
        Reciver := 'rogengell@hotmail.com';

        Subject := 'Project Over Deadline';

        Body := '';

        if ProjectTable.FindSet() then
            repeat
                if ProjectTable.timeUsed > ProjectTable.TotalTime then begin
                    Body += ProjectTable.ProjectName + '\n';
                    Body += Format(ProjectTable.TotalTime) + '\n';
                    Body += Format(ProjectTable.timeUsed) + '\n';
                    Body += '\n';
                end;
            until ProjectTable.Next() = 0;

        if not (Body = '') then begin
            EmailMessage.Create(Reciver, Subject, Body);
            Email.Send(emailMessage, "Email Scenario"::"SendEmails");
        end;

    end;
}
