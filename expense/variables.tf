
#EC2 variables
variable "instance_names"{
    type = list
    default = ["db","backend","frontend"]
}

variable "image_id" {
  
   type = string #optional
   default = "ami-090252cbe067a9e58" #optional
   description = "RHEL-9 AMI ID" #optional

}

variable "instance_type"{
    type = string  # by giving there wil be adv, bymistake if we give number error wil show clearly
    default = "t3.micro"
}

variable "common_tags"{
     
    default = {
        project ="expense"
        environment = "dev"
        Terraform = "true"
    }
}

# securiy_group variables
variable "sg_name" {
    default = "allow_ssh"
}

variable "sg_description"{
    default = "allowing port 22"
}

variable "ssh_port"{
    default = 22
}

variable "protocal"{
    default = "tcp"
}

variable "allowed_cidr"{
    type = list
    default = ["0.0.0.0/0"]
}

# r53 variables

variable "zone_id"{
    default = "Z05538612YG6UWTYOZ1BD"
}

variable "domain_name"{
    default = "csvdaws78s.online"
}