#variables for the modules
variable "ec2_size" {
    description = "Set for ec2 size you want"
    default = "t3.micro"

}

variable "ec2_name" {
    description = "Name of ec2 instance"
    default = "sogebot"
}


variable "root_volume_type" {
    description = "Root volume type"
    default = "gp3"
}

variable "root_volume_size" {
    description = "Root volume size"
    default = 30
}

variable "root_volume_throughput" {
    description = "Root volume throughput"
    default = 250
}

variable "key_name" {
    description = "ssh keyname"
    default = "sogebot-ssh"
}
variable "vpc_id" {
    description = "VPC ID"
    default = "vpc-487ef730"
}

variable "subnet_id" {
    description = "Subnet ID to put ec2 in"
    default = "subnet-cc0c60e7"
}