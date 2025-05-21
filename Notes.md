-- Run a module you need first >> terraform init
-- examples if IAC why did you prefer terraform over cloudformation?
-- state management 
-- how to make different environments uding terraform
-- structure of your terraform code
-- resource in aws we would like to managed it by terraform and vice versa ?
------------------------------------------------------------------
5-create s3 event notification to detect changes in state file and send the email
-- Go to your bucket
-- under properities >> Event notification >> create
Event name  >> notify_when_tfstate_change
prefix  >>  terraform 
suffix  >> tfstate
Event types 
PUT   AND   POST     
send (JSON) to >>>>>>>>>>>> Lambda to send email with details in JSON
-- GO to SES  (simple email service)
   create identity  >> Email  >> put your email >> verfiy