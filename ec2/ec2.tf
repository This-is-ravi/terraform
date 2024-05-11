# resource <resource-type> <resource-name>
resource "aws_instance" "db" {    # creating ec2 instance in AWS
    ami = "ami-090252cbe067a9e58"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] # before creating ec2 instance 1st create SG
    instance_type = "t3.micro"
    tags = {    # this is map
    Name = "db"
  }
}


 resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"

    ingress {    # inbound and this is block 
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"  # internet works on tcp protocal
        cidr_blocks      = ["0.0.0.0/0"]
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


