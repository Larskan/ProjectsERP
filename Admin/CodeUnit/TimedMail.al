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
    begin
        //rogengell@hotmail.com
        Receiver := 'lars16n6@easv365.dk';

        Subject := 'Project Over Deadline';

        Body := '';

        //ProjectTable.Init();
        if ProjectTable.FindSet() then
            repeat
                Message('repeat');
                ProjectTable.CalcFields(TotalTime, timeUsed);
                if ProjectTable.timeUsed > ProjectTable.TotalTime then begin
                    Body += ProjectTable.ProjectName + '\n';
                    Body += Format(ProjectTable.TotalTime) + '\n';
                    Body += Format(ProjectTable.timeUsed) + '\n';
                    Body += '\n';
                    Message('Time difference');
                end;
            until ProjectTable.Next() = 0;

        Message(Body);

        if not (Body = '') then begin
            EmailMessage.Create(Receiver, Subject, Body);
            Email.Send(EmailMessage, "Email Scenario"::"SendEmails");
        end;

    end;
}
