#  Terraform Basics
Run a module:   terraform init
    Initializes the working directory containing Terraform configuration files. 
    Downloads required providers and modules.

✅ Why Terraform over CloudFormation (Examples of IaC)?
Terraform advantages:
    Multi-cloud support (AWS, Azure, GCP, etc.), unlike CloudFormation (AWS-only).
    Easier state management with .tfstate.
    Modules encourage code reusability.
    Terraform CLI and Terraform Cloud offer richer CI/CD integrations.
Example IaC use cases:
    Deploying VPCs, EC2s, RDS, S3, etc.
    Managing IAM roles, security groups.
    Creating EKS clusters, load balancers.

✅ State Management in Terraform
    Keeps track of infrastructure resources in .tfstate file.
    Required for comparing real infrastructure with configuration.
    Stored locally or remotely (e.g., in S3 with DynamoDB locking).
    Best Practice: Use remote backend for teams.

✅ Different Environments (Dev / Prod) with Terraform
You can use:
1. Directory Structure:
    environments/
    ├── dev/
    │   └── main.tf
    ├── prod/
    │   └── main.tf
2. Workspaces:
    terraform workspace new dev
    terraform workspace new prod
    terraform workspace select dev
3. tfvars files:
    dev.tfvars, prod.tfvars
    terraform apply -var-file="dev.tfvars"

✅ Structure of Terraform Code
    .
    ├── main.tf          # main resources
    ├── variables.tf     # input variables
    ├── outputs.tf       # output values
    ├── terraform.tfvars # variable values
    ├── modules/         # reusable modules
    │   └── vpc/
    │   └── ec2/
    ├── environments/    # dev, prod, staging

✅ Create S3 Event Notification + Email Alert
Goal: Send email when .tfstate changes.
🔹 Steps:
1. Go to your S3 bucket → Properties → Event Notification:
    Event Name: notify_when_tfstate_change
    Prefix: terraform
    Suffix: tfstate
    Event types: PUT, POST
    Destination: Lambda

2. Lambda Function:
    Parses the event JSON
    Sends email via SES with .tfstate change details

3. Go to SES (Simple Email Service):
    Create Identity → Email address
    Enter your email and verify it