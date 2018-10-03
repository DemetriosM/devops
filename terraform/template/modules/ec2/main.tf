resource "aws_instance" "ec2" {
  ami                         = "${var.ami}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  subnet_id                   = "${var.subnet_id}"
  vpc_security_group_ids      = ["${var.vpc_security_group_ids}"]

  tags {
    Name = "${lower(var.name)}-ec2-${count.index+1}"
  }

  provisioner "remote-exec" {
    inline = [<<EOF
      sudo apt-get update
      sudo apt-get -y install apache2 php-mysql php libapache2-mod-php
      sudo rm /var/www/html/index.html
      cd /tmp/
      wget https://wordpress.org/latest.tar.gz
      sudo tar -xzf latest.tar.gz -C /var/www/html/
      sudo rm latest.tar.gz
      sudo mv -f /var/www/html/wordpress/* /var/www/html/
      sudo mv -f /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
      sudo sed -i 's/localhost/${var.db_host}/g' /var/www/html/wp-config.php
      sudo sed -i 's/username_here/${var.db_user}/g' /var/www/html/wp-config.php
      sudo sed -i 's/password_here/${var.db_password}/g' /var/www/html/wp-config.php
      sudo sed -i 's/database_name_here/${var.db_name}/g' /var/www/html/wp-config.php
      sudo service apache2 restart
    EOF
    ]
    connection {
      type        = "${var.connection_type}"
      user        = "${var.connection_user}"
      private_key = "${var.private_key_path}"
    }
  }
}