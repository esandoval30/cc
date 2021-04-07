sfdx force:org:create -f config/project-scratch-def.json -d 30 -s -w 3
sfdx force:source:push
sfdx force:user:password:generate

#assign  AUDIT FIELD AND Einstein Case Classification User permsets
sfdx force:user:permset:assign --permsetname Audit_Fields
sfdx force:user:permset:assign --permsetname EinsteinAgent

#install Einstein Case Classification Value Analytics
sfdx force:package:install -p 04tB0000000UQjfIAG --noprompt

#bulk load Closed Cases
sfdx shane:data:dates:update -r 09-24-2020
sfdx force:data:bulk:upsert -s Case -f data-modified/ClosedCases.csv -i External_Id__c


sfdx force:org:open