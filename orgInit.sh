sfdx force:org:create -f config/project-scratch-def.json -d 7 -s -w 3
sfdx force:source:push
sfdx force:user:password:generate

#assign  AUDIT FIELD AND Einstein Case Classification User permsets
sfdx force:user:permset:assign --permsetname Audit_Fields
sfdx force:user:permset:assign --permsetname EinsteinAgent

#install Einstein Language Intent Accuracy Package
sfdx force:package:install -p 04t4J000002AU7A --noprompt

#bulk load Closed Cases
sfdx force:data:bulk:upsert -s Case -f data/ClosedCases.csv -i External_Id__c
#bulk load New Cases With Actual Parent & Issue Type!
sfdx force:data:bulk:upsert -s Case -f data/OpenCases.csv -i External_Id__c

sfdx force:org:open
#Id batchInstanceId = Database.executeBatch(new BatchCaseInserter(), 1);