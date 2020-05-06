resource "null_resource" "commands_to_run" {
  provisioner "remote-exec" {
    connection {
        type            = "ssh"
        user            = "centos7"
        private_key     = "${file("~/.ssh/id_rsa")}"
        host            = "${aws_instance.centos7.public_ip}"
    }
    inline = [
    #   "sudo yum install -y epel-release",
    #   "sudo yum install telnet -y",
    #   "sudo yum install -y yum-utils device-mapper-persistent-data lvm2 ansible git python-devel python-pip python-docker-py vim-enhanced ",
    #   "sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
    #   "sudo yum install  docker-ce -y",
    #   "sudo systemctl start docker",
    #   "sudo systemctl enable docker",
    #   "sudo pip uninstall docker docker-py docker-compose",
    #   "sudo pip install docker-compose==1.9",


    "sudo yum install serverbackup-enterprise -y",
    "serverbackup-setup --user r1softteam3 --pass team3project",
    "serverbackup-setup --http-port 26080 --https-port 26443",
    "/etc/init.d/cdp-server restart",
    ]
  }
  provisioner "file" {
    connection {
        type            = "ssh"
        user            = "centos7"
        private_key     = "${file("~/.ssh/id_rsa")}"
        host            = "${aws_instance.centos7.public_ip}"
    }
    source      = "r1soft.repo"
    destination = "/etc/yum.repos.d/r1soft.repo"
  }
#   provisioner "remote-exec" {
#     connection {
#         type            = "ssh"
#         user            = "centos7"
#         private_key     = "${file("~/.ssh/id_rsa")}"
#         host            = "${aws_instance.centos7.public_ip}"
#     }
#     scripts = ["${file("wordpress.sh")}"]
#   }
}