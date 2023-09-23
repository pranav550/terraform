variable age {
    type = number
}

variable username {
  type= string
}

output printUserAge {
    value = "Hello, ${var.username}, your age is ${var.age} "
}