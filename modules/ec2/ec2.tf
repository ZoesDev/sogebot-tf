resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh
}

resource "local_sensitive_file" "pem_file" {
  filename = pathexpand("${path.module}/${var.key_name}.pem")
  file_permission = "600"
  directory_permission = "700"
  content = tls_private_key.this.private_key_pem
}


resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_size
  key_name      = aws_key_pair.generated_key.key_name
  root_block_device {
      volume_type = var.root_volume_type
      volume_size = var.root_volume_size
      throughput = var.root_volume_throughput
  }
  subnet_id = var.subnet_id
  user_data = ""
  security_groups = [aws_security_group.this.id]

  tags = {
    Name = var.ec2_name
  }
}