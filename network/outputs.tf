output subnets {
  value       = aws_subnet.subnets_m
}

output vpc_id {
  value       = aws_vpc.MyVPC.id
}

output ssh_sg {
  value       = aws_security_group.allow_ssh.id
}

output app_sg {
  value       = aws_security_group.allow_ssh_3000.id
}
