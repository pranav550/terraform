#creating instance
resource "aws_instance" "web" {
  ami           = "${var.image_id}"
  instance_type = "${var.instance_type}"
  key_name      = "${aws_key_pair.key-tf.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-tf-instance"
  }
  user_data = file("${path.module}/script.sh")
  # user_data = <<-EOF
  # #!/bin/bash
  # sudo apt-get update
  # sudo apt-get install nginx -y
  # sudo echo "Hi Pranav">/var/www/html/index.nginx-debian.html
  # EOF

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host = "${self.public_ip}"
  }


# file, local-exec, remote-exec
provisioner "file" {
  source = "readme.md"
  destination = "/tmp/readme.md"
}

provisioner "file" {
  content = "this is test content"
  destination = "/tmp/content.md"
}

provisioner "local-exec" {
  command = "echo ${self.public_ip}>/mypublicip.txt"
}

 provisioner "local-exec" {
    working_dir = "/tmp"
    command = "echo ${self.public_ip}>myip.txt"
  }
  provisioner "local-exec" {
    interpreter = [
      "/usr/bin/python3", "-c"
    ]
    command = "print('HelloWorld')"
  }
  provisioner "local-exec" {
    command = "env>env.txt"
    environment = {
      envname = "envvalue"
    }
  }

}
