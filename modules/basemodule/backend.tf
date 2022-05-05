#backend config if you have want to use this code in a CICD or accross multiple accounts.
# this will store the code in the S3 bucket and Dynamodb table you state
# Just uncomment the code below to use this
# S3 buckets are global unquie so make sure to change it to your s3 bucket and region



# terraform {
#   backend "s3" {
#     bucket         = "sogebot-tf-states"
#     encrypt        = true
#     region         = "us-west-2"
#     key            = "sogebot/terraform.tfstate"
#     dynamodb_table = "tf-locks"
#   }
# }