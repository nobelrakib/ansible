# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  # VPC Basic Details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"   
  azs                 = ["us-east-1a"]
  private_subnets     = ["10.0.1.0/24"]
  public_subnets      = ["10.0.101.0/24"]

  
  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  tags = {
    Owner = "rakib"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }
}

resource "aws_security_group" "allow_all" {
  vpc_id      = module.vpc.vpc_id
  name        = "allow-all"
  description = "Allow all inbound and outbound traffic"
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#resource "aws_key_pair" "TF_key" {
#  key_name   = "TF_key"
#  public_key = tls_private_key.rsa.public_key_openssh
#}

#resource "tls_private_key" "rsa" {
#  algorithm = "RSA"
#  rsa_bits  = 4096
#}

#resource "local_file" "TF-key" {
#    content  = tls_private_key.rsa.private_key_pem
#    filename = "tfkey"
#}

resource "aws_instance" "public_instance" {
  count         = 1
  ami           = "ami-080e1f13689e07408"  # Your AMI ID
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  security_groups = [aws_security_group.allow_all.id]
  #key_name = "TF_key"
  key_name ="demo"

  tags = {
    Name = "node-${count.index}"
    # Add any other tags you require for the instance
  }
  timeouts {
    create = "30m"  # Set the create timeout to 30 minutes
    # Other timeout configurations can be set here if needed
  }
}

resource "aws_instance" "private_instances" {
  count         = 3
  ami           = "ami-080e1f13689e07408"  # Your AMI ID
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnets[0]
  security_groups = [aws_security_group.allow_all.id]
  #key_name = "TF_key"
  key_name ="demo"
  tags = {
    Name = "private-instance-${count.index}"
    # Add any other tags you require for the instance
  }

  timeouts {
    create = "30m"  # Set the create timeout to 30 minutes
    # Other timeout configurations can be set here if needed
  }
}



