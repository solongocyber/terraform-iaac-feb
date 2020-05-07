    
### --- fs.tf file ---
We define the following resources:

- aws_efs_file_system
- aws_efs_mount_target
- aws_security_group

Creating file system:

    
     resource "aws_efs_file_system" "my-efs" {
     creation_token = "my-product"
     tags = "${var.tags}"
     }














Mounting EFS to an instance:

        resource "aws_efs_mount_target" "my-mount" {
        file_system_id = "${aws_efs_file_system.my-efs.id}"
        subnet_id     = "${aws_subnet.public1.id}"
        security_groups = [
      "${aws_security_group.my-sg.id}"
    ]
       }