codeunit 50125 TimedMail
{

    procedure SendProjectEmails()
    var
        Projects: Record Projects;
        Email: Record "Email Item";
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text[250];
        EmailBody: Text[250];
        Recipients: Text[250];
        CurrentTime: Time;

    begin
        //Get current time
        CurrentTime := TIME;

        //Check if current time is midnight
        if CurrentTime = TIME then begin
            //Loop through all projects
            Projects.Reset();
            while Projects.Next do begin
                //Check if timeUsed is greater than TotalTime
                if Projects.timeUsed > Projects.TotalTime then begin
                    //create email subject
                    EmailSubject := 'Project ' + FORMAT(Projects.ProjectID) + ' needs attention';

                    //create email body
                    EmailBody := 'Project ' + Projects.ProjectName + ' has exceeded its allotted time by ' + FORMAT(Projects.timeUsed - Projects.TotalTime) + ' hours.';

                    //Get email recipients
                    Recipients := 'heinotestmail@gmail.com';

                    //Create email record
                    Email.Init();
                    Email.Subject := EmailSubject;
                    Email.Body := EmailBody;
                    Email."Send to" := Recipients;


                end;
            end;
        end;
    end;

    procedure GetProjectsToSendEmail();
    var
        //Forsøg på at bruge SMTP istedet, gik ikke helt som planlagt, 
        //siden den vil ikke lade mig tilføje de nødvendige dependencies in app.json
        Projects: Record Projects;
        Email: Record "Email Item";
        //SMTP: DotNet "'System.Net, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Net.Mail.SmtpClient";
        //MailMessage: DotNet "'System.Net, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Net.Mail.MailMessage";
        EmailSubject: Text[250];
        EmailBody: Text[250];
        Recipients: Text[250];
    begin
        // Initialize email subject and body
        EmailSubject := 'Projects with excess time usage';
        EmailBody := 'The following projects have exceeded their allotted time:';

        // Loop through all projects
        Projects.RESET;

        while Projects.NEXT = true do begin
            // Check if timeUsed is greater than TotalTime
            if Projects.timeUsed > Projects.TotalTime then begin
                // Append project name to email body
                EmailBody := EmailBody + ' ' + Projects.ProjectName;

                // Set project as not done
                Projects.ProjectDone := false;
                Projects.Modify();
            end;
        end;

        // Get email recipients
        Recipients := 'lars16n6@easv365.dk';

        // Create email message
        MailMessage := MailMessage.DotNetObject();
        MailMessage.From := 'lars16n6@easv365.dk';
        MailMessage."Send To"(Recipients);
        MailMessage.Subject := EmailSubject;
        MailMessage.Body := EmailBody;

        // Set SMTP client configuration
        SMTP := SMTP.DotNetObject('System.Net.Mail.SmtpClient', 'smtp.dk', 587);
        SMTP.EnableSsl := true;
        SMTP.Credentials := SMTP.DotNetObject('System.Net.NetworkCredential', '	lars16n6@easv365.dk', '3LtUy7sV');

        // Send email
        SMTP.Send(MailMessage);
    end;


    /*
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
    */




}
