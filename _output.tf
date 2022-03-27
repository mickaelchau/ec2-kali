output "ec2_public_ip" {
  value = aws_instance.kali_ec2.public_ip
}

