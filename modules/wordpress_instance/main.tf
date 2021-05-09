//create wordpress instance 
resource "aws_instance" "wordpress" {
  ami           = var.image_id
  instance_type = "t2.micro"
  key_name   = "rema-hw"
  subnet_id       = var.subnet
  security_groups = var.security_groups

  	user_data = <<-EOF
		#! /bin/bash
    sudo apt update -y
		sudo apt install docker.io -y
    sudo docker run -itd -e WORDPRESS_DB_HOST=${var.mysql_ip}  -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpress -v wp_site:/var/www/html -p 80:80 wordpress



	EOF

  tags = {
    Name = "wordpress-HW4"
  }
}