global class ScheduledCaseInserter implements Schedulable {
    public static String cronExp = '0 0 1 * * ?'; 
    
	global void execute(SchedulableContext sc)
    {
        Database.executeBatch(new BatchCaseInserter());
    }
}