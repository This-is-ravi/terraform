# resource <resource-type> <resource-name>
resource "aws_instance" "db" {    # creating ec2 instance in AWS
    ami = "ami-090252cbe067a9e58"
    vpc_security_group_ids = ["sg-02b3e7e7724074fae"] # before creating ec2 instance 1st create SG
    instance_type = "t3.micro"
    tags = {    # this is map
    Name = "db"
  }
}


 