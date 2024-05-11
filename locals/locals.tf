locals{
    ami_id = "ami-090252cbe067a9e58" # devops-practice RHEL
    sg_id = "sg-02b3e7e7724074fae" # aws->SG->alloweverything-sg_id
    instance_type = "t3.micro"
    
    tags = {
        name = "locals"
    }
}