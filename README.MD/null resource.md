
### null_resource.tf




     resource "null_resource" "commands_to_run" {
     triggers = {
     always_run = "${timestamp()}"
    }
     provisioner "file" { 
    connection {
      type        = "ssh"
      user        = "centos"
      private_key = "${file("~/.ssh/id_rsa")}"
      host        = "${aws_instance.centos.public_ip}"
    }

    source      = "r1soft.repo"
    destination = "/tmp/r1soft.repo"
    }   
      provisioner "remote-exec" {
      connection {
      type        = "ssh"
      user        = "centos"
      private_key = "${file("~/.ssh/id_rsa")}"
      host        = "${aws_instance.centos.public_ip}"
    }

    inline = [
      "sudo mv /tmp/r1soft.repo /etc/yum.repos.d/r1soft.repo",
      "sudo yum install serverbackup-enterprise -y",
      "sudo serverbackup-setup --user admin --pass password --http-port 80",
      "sudo /etc/init.d/cdp-server restart",

      "sudo yum install -y nfs-utils",
      "sudo mkdir -p /efs",
      "sudo mount -t nfs ${aws_efs_file_system.my-efs.id}:/ /efs",
      "sudo chmod 777 /etc/fstab",
      "sudo echo '${aws_efs_file_system.my-efs.id}':/ /efs efs defaults,_netdev 0 0 >> /etc/fstab",
      "sudo systemctl restart nfs",
          ]
        }
    }    