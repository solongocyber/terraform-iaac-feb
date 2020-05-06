provider "aws" {
  region  = "eu-west-2" 
  version = "2.59"
}
data "aws_ami" "centos7" {   // resource name has to be different. ex : centos6 , centos7
  most_recent = true   /// find latest
  owners      = ["679593333241"]  // this iwner id never change all centos have same number
  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"] // this value is ami and ami name doesn't need to mentioned as long as centos7, centos6, it is find
  }
}

resource "aws_instance" "centos7" {
  ami           = "${data.aws_ami.centos7.id}" //this is ami created earlier
  instance_type = "t2.micro"     
  key_name      =   "${aws_key_pair.r1soft.key_name}"
  security_groups = ["${aws_security_group.task3_sg.id}"]

  provisioner "file" {     //
    connection {               //this is how i connect provisioner to instance with parameters. it means us thiese parameters and perform task in the provisioner.
        type            = "ssh"
        user            = "centos7"
        private_key     = "${file("~/.ssh/id_rsa")}" // aws not allow me to connect password so private key location need to provided. 
        host            = "${self.public_ip}" //it mmeans do ssh and find instance's ip address
    } 
   source = "r1soft.repo"  #machine that you are executing the terraform code 
   destination = "/etc/yum.repos.d/r1soft.repo" #instance that you are creating with your terraform code.

  provisioner "remote-exec" {     //
    connection {               //this is how i connect provisioner to instance with parameters. it means us thiese parameters and perform task in the provisioner.
        type            = "ssh"
        user            = "centos7"
        private_key     = "${file("~/.ssh/id_rsa")}" // aws not allow me to connect password so private key location need to provided. 
        host            = "${self.public_ip}" //it mmeans do ssh and find instance's ip address
    }
    
    inline = [                             
      "sudo cp /tmp/r1soft.repo /etc/yum.repos.d/",
      "sudo yum install r1sodft-cdp-enterprise-server -y",
      "sudo r1soft-setup --user admin --pass mystrongpassword --http-port 80",
      "sudo systemctl restart cdp-server",
    ]
  }
}
output "centos7" {
  value = "${data.aws_ami.centos7.id}"
}
}
