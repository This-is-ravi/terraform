# resource <resource-type> <resource-name>
resource "aws_instance" "expense" {    # creating ec2 instance in AWS
    count = length(var.instance_names)
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] # before creating ec2 instance 1st create SG
    instance_type = var.instance_names[count.index] == "db"? "t3.small" : "t3.micro"   
    # it is condition index 0 db=db True install t3.small,nxt indx 1 backend=db false instal t3.micro
    tags = merge(
         var.common_tags,
        {
           Name = var.instance_names[count.index]
           module = var.instance_names[count.index]
        }
    )
}


 resource "aws_security_group" "allow_ssh" {
    name = var.sg_name 
    description = var.sg_description

    ingress {    # inbound and this not map or list its a block
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


