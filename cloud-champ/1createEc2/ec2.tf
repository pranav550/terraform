resource "aws_instance" "web" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  count                  = 2
  vpc_security_group_ids = ["${aws_security_group.TF_SG.id}"]
  #   security_groups = ["${aws_security_group.TF_SG.name}"]
  key_name = "tf-key"
  tags = {
    Name = "HelloWorld ${count.index}"
  }
}

resource "aws_key_pair" "tf-key" {
  key_name   = "tf-key"
  public_key = file("${path.module}/tfkey.pub")
}


# resource "aws_key_pair" "tf-key" {
#   key_name   = "tf-key"
#   public_key = "${tls_private_key.rsa.public_key_openssh}"
# }

# resource "tls_private_key" "rsa" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "local_file" "tf-key" {
#   content  = "${tls_private_key.rsa.private_key_pem}"
#   filename = "tfkey"
# }



resource "aws_security_group" "TF_SG" {
  name        = "security group using terraform"
  description = "security group using terraform"
  vpc_id      = "vpc-0400a312cf4867dd7"

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "TF_SG"
  }
}