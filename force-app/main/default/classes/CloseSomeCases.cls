public class CloseSomeCases {
    
    @AuraEnabled
    public static void closeSomeCases() {
        List<case> cases = [select id, actual_parent_type__c,actual_type__c,  parent_type__c, type, status from Case where status='New' limit 2000];

        List<String> parentTypes = new List<String>{'ROAD MAINTENANCE ISSUES','GARBAGE','RECYCLING','MOWING AND TREE ISSUES'};
        List<String> caseTypes = new List<String>{'DAMAGED GARBAGE CART','MISSED WOODY WASTER SERVICE','TALL GRASS','STREET LIGHT OUTAGE OR DAMAGE'};
        
        Integer actualtypesUsed = 0;
        Integer randomtypesUsed = 0;
        
        for (Case c: cases) {
            if (Math.random() <= 0.85) {
                c.parent_type__c = c.actual_parent_type__c;
                c.Type = c.actual_type__c;
                actualtypesUsed++;
            } else {
                Double randomNumber = Math.random(); 
                Integer arrayLength = 4; 
                Integer randomIndex = (randomNumber *(arrayLength-1)).intValue();
                
                c.parent_type__c = parentTypes[randomIndex];
                c.Type = caseTypes[randomIndex];
                randomtypesUsed++;
            }
             c.Status = 'Closed';
        }
        
        System.debug(actualtypesUsed);
        System.debug(randomtypesUsed);
        if (cases!=null && cases.size() > 0) {
            update cases;    
        }
        
    }

}