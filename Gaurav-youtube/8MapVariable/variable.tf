variable "userage" {
    type = map
    default = {
        gaurav = 20
        saurav = 19
    }
}

variable "username" {
  type= string
}

output printUserAge {
    value = "my name is ${var.username} and age is ${lookup(var.userage,"${var.username}")}"
}