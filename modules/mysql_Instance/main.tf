//create mysql instance 
resource "aws_instance" "mysql-public" {
  ami           = var.image_id
  instance_type = "t2.micro"
  key_name   = "rema-hw"
  subnet_id       = var.subnet
  security_groups = var.security_groups

  	user_data = <<-EOF
		#! /bin/bash
    sudo apt update -y
		sudo apt install docker.io -y
    sudo docker run -itd -e MYSQL_ROOT_PASSWORD=315020974 -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress -v wordpress:/var/lib/mysql -p 3306:3306 -d mysql:latest



	EOF

  tags = {
    Name = "MySQL-p-HW4"
  }
}
