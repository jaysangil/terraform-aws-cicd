output "pb_sn" {
    value = aws_subnet.main.id
}

output "sg" {
    value = aws_security_group.main.id 
}

