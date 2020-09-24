public class GenerateCasesController {
    
    @AuraEnabled
    public static void generateCases() {
		Database.executeBatch(new BatchCaseInserter());
    }

}