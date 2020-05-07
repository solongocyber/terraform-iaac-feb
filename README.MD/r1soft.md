![r1soft (1)](https://user-images.githubusercontent.com/63433671/81338592-82010d80-9072-11ea-85a5-cdb4ecd7608d.jpg)

## **R1soft Server Installation**
                          
                          
                          
                          
                          
                          
                          
### Terraform Project - Team 3

### Prerequist:

We tested Bastion with  :
-  - t2.micro 
-  - CPU 1
- - Memory 1 GB
-  - Terraform version - 0.11.14




#### R1soft server installation, creating and mounting EFS with Terraform

 * In this project we created an instance to host R1soft server and add EFS using terraform. All these components are configured properly and our code is reusable and works any region of AWS.

*  Create VPC with:
    - 3 private  subnets
    - 3 public   subnets

    - Public subnets attached to IGW.  

    - Private subnets attached to NG.  

* Configure Route tables 
 
* Create Public and private keys 

* Install R1soft server

* Create EFS and mount it to the system

* Add Security groups and open nessasarly ports

* Create Variables , outputs and tags

* Created instance


 


                   ------ What is R1soft: -----
 
 The R1Soft Server Backup Manager is a backup application for Linux and Windows machines that runs nearly continuously and is developed by R1Soft. R1Soft technology allows you to implement Backup as a Service via incremental backups – it provides a backup of files that have changed or are new since the last backup. R1soft is copying data on the block level, which significantly reduces backup time and server resource utilization.



In here these steps followed using Terraform: 

1. Creating an AWS VPC  with 3 private, 3 public  subnets.

   ![vpc](https://user-images.githubusercontent.com/63433671/81337892-5f222980-9071-11ea-850a-628bf0540e01.png)


2. Instance created with R1softserver installation 

![Untitled](https://user-images.githubusercontent.com/63433671/81338832-dc01d300-9072-11ea-86b5-989458b62e6c.png)


3. EFS file created and mounted in to instance


<img width="694" alt="Screen Shot 2020-05-07 at 1 47 27 PM" src="https://user-images.githubusercontent.com/63433671/81339000-22573200-9073-11ea-97c6-5557cbebcdbf.png">

 

