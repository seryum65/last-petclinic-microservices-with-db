//variable "aws_secret_key" {}
//variable "aws_access_key" {}
variable "region" {
  default = "us-east-1"
}
variable "mykey" {
  default = "petclinic-ranchertr"
}
variable "tags" {
  default = "petclinic-rancher-server"
}
variable "myami" {
  description = "ubuntu 20.04 ami"
  default = "ami-0149b2da6ceec4bb0"
}
variable "instancetype" {
  default = "t3a.medium"
}

variable "secgrname" {
  default = "rancher-server-sec-gr"
}

variable "domain-name" {
  default = "yusufsahin.link"
}

variable "rancher-subnet" {
  default = "subnet-00f423b1ce22303dd"
}

variable "hostedzone" {
  default = "yusufsahin.link"
}