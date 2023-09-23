# create  rds DB using terraform
resource "aws_db_instance" "myrds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0.33"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}


#mysql -h  -P   -u  -p
#in rds database eable port 3306
#in rds database for mysql workbench enable port all ipv6
#commands for mysql
#SHOW DATABASES; 

#psql  -h   -p  -U  -W
#port no 5432
#apt-get -y install postgresql
#in rds database enable port 5432
#commands for postgresql
#\l
#\q


