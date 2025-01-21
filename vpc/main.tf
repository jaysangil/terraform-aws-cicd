resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.amin.id 
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true 
    availability_zone = "us-east-1a"
}

resource "aws_security_group" "main" {
    vpc_id = aws_vpc.main.id 
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}