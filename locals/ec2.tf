# resource <resource-type> <resource-name>
resource "aws_instance" "db" {    # creating ec2 instance in AWS
    
    ami = local.ami_id
    vpc_security_group_ids = [local.sg_id] # before creating ec2 instance 1st create SG
    instance_type = local.instance_type
    
    tags = local.tags
}




