data "aws_ami" "ubuntu" {

  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
  
}


resource "aws_security_group" "asg-web" {
  name = "asg-web-2"
  description = "Acesso Web"
    
    ingress {
        description      = "Server Web"
        from_port        = var.server_port
        to_port          = var.server_port
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }  

}


resource "aws_instance" "web" {
    count = "${var.qtd < 1 && var.enviroment == "production" ? var.qtd + 2 : 1}"
    ami = data.aws_ami.ubuntu.id
    instance_type = "${count.index < 1 ? "t2.micro" : "t3.midium"}"
    vpc_security_group_ids = [aws_security_group.asg-web.name]

    user_data = <<-EOF

              #!/bin/bash
              echo "Hello, world" > index.html
              nohup busybox httpd -f -p ${var.server_port} &

              EOF  

    tags = {
      "Name" = "HelloWorld"
    }
}