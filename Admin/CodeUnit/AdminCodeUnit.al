//Open Page with Insert
codeunit 50121 AdminTaskCode
{
    //Opens TaskPageCard and sets record on page to new task record depending on ProjectID
    //Params: No = ProjectID
    procedure TaskCardPage(var No: Integer)
    var
        projectId: Integer;
        taskCard: Page "TaskPageCard";
        tasks: Record TasksTable;
    begin
        projectId := No;
        tasks.Init();
        tasks.ProjectID := projectId;
        tasks.Insert();
        taskCard.SetRecord(tasks);
        taskCard.Run();
    end;

    //Selects task and opens its card page
    //Only select 1
    procedure SelectTask(var Task: Record TasksTable)
    var
        taskPage: page TaskPageCard;
        countAmount: Integer;
    begin
        //Checks if the task exists
        if task.FindSet() then
            //Loop, adds increment for each record
            repeat
                countAmount += 1;
            until task.Next() = 0;
        //1 means only 1 record, so select that record
        if countAmount = 1 then begin
            Task.FindFirst();
            taskPage.SetRecord(Task);
            taskPage.Run();
        end
        else begin
            Message('Select Only One');
        end;
    end;

    procedure OpenEmpDoc(var Task: Record TasksTable)
    var
        EmployeeTaskDocument: Page "EmployeeTaskDocument";
        countAmount: Integer;
    begin
        if Task.FindSet() then
            repeat
                //Checks if theres several
                countAmount += 1;
            until task.Next() = 0;
        //Check if theres 1, if yes: open employee page depending on Record you found
        if countAmount = 1 then begin
            Task.FindFirst();
            //Set the Record from selected task as Employees Task Record source
            EmployeeTaskDocument.SetRecord(Task);
            EmployeeTaskDocument.Run();
        end
        else begin
            Message('Select Only One');
        end;
    end;

    //Loop that iterates over each record in table.
    //If matched, it becomes true and Modify() is called to update record
    procedure MarkTaskDone(var projectId: Integer)
    var
        TaskTable: Record TasksTable;
    begin
        if TaskTable.FindSet() then
            repeat
                if TaskTable.ProjectID = projectId then begin
                    TaskTable.TaskFinished := true;
                    TaskTable.Modify();
                end;
            until TaskTable.Next() = 0;
    end;

}

codeunit 50117 EmpToTask
{
    //Params: Ref to EmployeeTable and Ref to a Record of the TaskTable
    //Return: Boolean
    //Count number of records in EmployeeTable, if 1 record: set EmpID field in TaskTable to EmpID of EmployeeTable and set empAdded to true
    //If more than 1 record: Return false without modifying the TaskTable Record
    procedure addEmpToTask(var EmployeeTable: Record EmployeeTable; var TasksTable: Record TasksTable) result: Boolean
    var
        countAmount: Integer;
    begin
        if EmployeeTable.FindSet() then
            repeat
                countAmount += 1;
            until EmployeeTable.Next() = 0;
        //Make sure only one employee is selected
        if countAmount = 1 then begin
            //Find first employee
            EmployeeTable.FindFirst();
            //Update TaskTable Employee ID to match selected Employees ID
            TasksTable.EmpID := EmployeeTable.EmpID;
            //empAdded adds checkmark that Employee has been added to task
            TasksTable.empAdded := true;
            TasksTable.Modify();
            result := true;
        end
        else begin
            result := false;
        end;
    end;
}