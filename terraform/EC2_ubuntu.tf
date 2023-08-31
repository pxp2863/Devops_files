provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "app_server" {
  ami           = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  key_name = "newkeypair"
  security_groups = ["allow_ssh"]

  tags = {
    Name = "ExampleAppServerInstance"
  }
}



resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"

  ingress {
    description      = "ssh from VPC"
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
    Name = "allow_ssh"
  }
}