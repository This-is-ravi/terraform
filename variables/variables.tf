#command line -->1st preference how to override a variable through cmd line in terraform?
#tfvars
#env variable
#variable default value

variable "image_id" {
  
   type = string #optional
   default = "ami-090252cbe067a9e58" #optional
   description = "RHEL-9 AMI ID" #optional

}

variable "instance_type"{
    type = string  # by giving there wil be adv, bymistake if we give number error wil show clearly
    default = "t3.micro"
}

variable "tags"{
     
    default = {
        project ="expense"
        environment = "dev"
        module ="db"
        name = "db"
    }
}

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