variable username {
    type = string
}

output printname {
    value = "Hello, ${var.username}"
}


#### for windows : set TF_VAR_username=Hina
