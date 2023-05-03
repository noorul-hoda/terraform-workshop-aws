
## Project Variables
region      = "eu-west-2"
project     = "infrafy"
environment = "dev" 
domain_name = "infrafy.codetronix.xyz" #Format => <project>.<company-name>.<domain-extensions>
profile     = "infrafy-tf-admin-dev"



## VPC variables
vpc-cidr-block = "10.20.0.0/16"
public-subnets-cidr-blocks = ["10.20.0.0/24", "10.20.1.0/24", "10.20.2.0/24"]
private-subnets-cidr-blocks = ["10.20.3.0/24", "10.20.4.0/24", "10.20.5.0/24"]

public-subnet-1-cidr-block = "10.20.0.0/24"
public-subnet-2-cidr-block = "10.20.1.0/24"
public-subnet-3-cidr-block = "10.20.2.0/24" 

private-subnet-1-cidr-block = "10.20.3.0/24"
private-subnet-2-cidr-block = "10.20.4.0/24"
private-subnet-3-cidr-block = "10.20.5.0/24"

## EC2 Bastion Host Variables
ec2-bastion-public-key-path = "../secrets/ec2-bastion-key-pair.pub"
ec2-bastion-private-key-path = "../secrets/ec2-bastion-key-pair.pem"
ec2-bastion-ingress-ip-1 = "0.0.0.0/0"