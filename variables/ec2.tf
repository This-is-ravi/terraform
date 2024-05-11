# resource <resource-type> <resource-name>
resource "aws_instance" "db" {    # creating ec2 instance in AWS
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] # before creating ec2 instance 1st create SG
    instance_type = var.instance_type  # left side is argument = right is value
    tags = var.tags
}


 resource "aws_security_group" "allow_ssh" {
    name = var.sg_name 
    description = var.sg_description

    ingress {    # inbound
        from_port        = var.ssh_port
        to_port          = var.ssh_port
        protocol         = var.protocal  # internet works on tcp protocal
        cidr_blocks      = var.allowed_cidr
    }

    egress {    # outbound
        from_port        = 0 # from 0 to 0 means, opening all protocols it maybe ssh,mysql..
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "ravi"
    }
}


