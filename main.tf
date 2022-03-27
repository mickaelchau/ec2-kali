resource "aws_instance" "kali_ec2" {
  ami             = local.instance_ami
  instance_type   = local.instance_type
  security_groups = [aws_security_group.api_security_terra.name]
  key_name        = aws_key_pair.ec2_keys.key_name
  tags = {
    Name = "${local.application_name}"
  }
  root_block_device {
    volume_size = local.volume_size
  }
}
