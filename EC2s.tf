resource "aws_instance" "Bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id =  module.mynetwork.subnets["PublicSubnet1"].id
  associate_public_ip_address = true
  vpc_security_group_ids = [module.mynetwork.ssh_sg]
  key_name = aws_key_pair.public_key_pair.key_name
  tags = {
    Name = "Bastion"
  }
}

resource "aws_instance" "application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = module.mynetwork.subnets["PrivateSubnet1"].id
  vpc_security_group_ids = [module.mynetwork.app_sg]
  key_name = aws_key_pair.public_key_pair.key_name    
  
  tags = {
    Name = "application"
  }
  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"
 }
}
