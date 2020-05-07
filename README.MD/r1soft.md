![Install-R1Soft-Backup-n-Configure-1-backup-600x600](https://user-images.githubusercontent.com/63433671/81267105-83e3b600-900b-11ea-879c-95e6d6d43852.jpg)
                  
## **R1soft Server Installation**
                          
                          
                          
                          
                          
                          
                          
### Terraform Project - Team 3


#### Introdaction about our project

 * In this project we created an instance to host R1soft server and add EFS using terraform. All these components are configured properly and our code is reusable and work in every region of AWS.

*  VPC - 6 subnets :
    - 3 private  subnet
    - 3 public   subnet

    - Public subnets attached to IGW.  

    - Private subnets attached to NG.  

* Route tables 
 
* Public and private key created

* Install R1soft server

* Create EFS and mounted to the system

* Security groups and open nessasarly ports

* Variuble

* Outputs

* 
 


                   ------ What is R1soft: -----
 
 The R1Soft Server Backup Manager is a backup application for Linux and Windows machines that runs nearly continuously and is developed by R1Soft. R1Soft technology allows you to implement Backup as a Service via incremental backups – it provides a backup of files that have changed or are new since the last backup. R1soft is copying data on the block level, which significantly reduces backup time and server resource utilization.

R1Soft technology guarantees:

- - Data integrity
- - High performance and speed when executing backups
- - Full file backup that are open in real time
- - Accurate database backups for MSSQL, MySQL without interruption
- - Full operation system support for Windows and Linux
- - Data backup from and to physical and virtual servers



 This tutorial will show you how to setup server using Terraform. 

Create EFS using terraform documentation above, and make sure it is automatically attached to an instance.  
. Once private and public subnet created, please create ec2 instance (manually)  on public subnet and ping google.com. If everything is successful, you should have proper response 

Moving forward on that VPC's public subnet, please create an instance to host R1soft server. Necessary requirements have to be met before creating an instance. Please read R1soft documentation for that. 
 If you want to learn Terraform, I highly recommend 

 Your provisioner commands should be used to mount the EFS after it's creation. R1soft username and password should be printed out as an output  If you want to learn Terraform, I highly recommend 

 Your provisioner commands should be used to mount the EFS after it's creation. R1soft username and password should be printed out as an output  