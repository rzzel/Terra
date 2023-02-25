
# Private Subnets
resource "aws_subnet" "private_subnets" {
  for_each   = var.private_subnets
  vpc_id     = data.aws_vpc.default.id
  cidr_block = cidrsubnet(data.aws_vpc.default.cidr_block, 8, each.value) //went from 8 to 12

  tags = {
    Terraform = true
  }
}

# Security Groups
resource "aws_security_group" "t3_tier_t3" { //change //changed
  name        = "t3_tier_t3" //name to be changed //changed
  description = "Allow inbound traffic"
  vpc_id      = data.aws_vpc.default.id
  ingress {
    description = "SSH Inbound"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.245.0/24", "120.29.76.169/32"]  //change this depending on your subnets 
  }
  egress {
    description = "Global Outbound"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "t3_tier_t3" //name to be changed //changed
    Purpose = "For dev"            //name to be changed //not realy yata
  }
}


resource "aws_instance" "key_ko" {//change
  ami                         = "ami-0ffac3e16de16665e" //change this for your  specific ami //already changed
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private_subnets["t3_tier_t3"].id //change
  security_groups             = [aws_security_group.t3_tier_t3.id] //change
  associate_public_ip_address = true
  //key_name                    = data.aws_key_pair.key_card //change
  key_name                    = data.aws_key_pair.key_ko3.key_name //change
  #   iam_instance_profile        = "CloudWatchAgentServerPolicy"

  tags = {
    Name = "t3_tier_t3" //change
  }
}

