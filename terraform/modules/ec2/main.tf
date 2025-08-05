resource "aws_instance" "webserver" {
  ami  = "ami-0f918f7e67a3323f0"
  instance_type = "t3.nano"
  subnet_id  = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true
  key_name = "ok"
  tags = {
    Name = "webserver"
  }
}


