variable users {
type = list
default = ["gaurav", "Saurav", "anKit"]
}


output printfirst {
// value = "first user is ${var.users[0]}"
value = "first user is ${join(",",var.users)}"
}


output helloWorldUpper {
value = "first user is ${upper(var.users[0])}"
}


output helloWorldLower {
value = "first user is ${lower(var.users[1])}"
}
