#step1: create vpc
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
   tags = {
    Name = "MyTerraformVPC"
  }
}

#step2: create public subnet
resource "aws_subnet" "PublicSubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
   tags = {
    Name = "Public Subnet"
  }
}

#step3: create private subnet
resource "aws_subnet" "PrivateSubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "Private Subnet"
  }
}
#step4: create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Internet-Gateway"
  }
}

#step5: create routetable connect to internet gateway
resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "RTable"
  }
}

#step6: Routetable associated with public subnet 
resource "aws_route_table_association" "PublicRTassociation" {
  subnet_id      = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.PublicRT.id
}