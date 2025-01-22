# define an AWS EC2 instance resource named server

resource "aws_instance" "server" {
    ami = "ami-043a5a82b6cf98947"
    instance_type = "t2.micro"
    subnet_id = var.sn
    security_groups = [var.sg]

    tags = {
        Name = "dev_server"
    }
}