global class BatchCaseInserter implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) 
    {
        //Take up to 1000 Closed cases with Parent and Issue Type already populated
        String query = 'SELECT Subject,Description,Parent_Type__c, Type FROM Case Where Status=\'Closed\' and Type!=null and Parent_Type__c!=null LIMIT 1000';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Case> cases)
    {
        List<Case> newCases = new List<Case>();
        for (Case c:cases)
        {
            //'Clone' Them (and store the actual so that we can compare against prediction later)
            Case newCase = new Case(
                Description=c.Description,Subject=c.Subject,
                Actual_Parent_Type__c = c.Parent_Type__c,
                Actual_Type__c = c.Type,
				Parent_Type__c='',
                Type='',
				Status='New');
            newCases.add(newCase);
        }
        insert newCases;
    }
    global void finish(Database.BatchableContext bc)
    {
        
    }
}