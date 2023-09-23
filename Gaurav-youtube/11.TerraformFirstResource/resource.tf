
resource "github_repository" "terraform-fist-repo" {
  name        = "first-repo-from-terraform"
  description = "My awesome codebase"
  visibility = "public"
  auto_init = true
}

# resource "github_repository" "terraform-second-repo" {
#   name        = "second-repo-from-terraform"
#   description = "My awesome codebase1"
#   visibility = "public"
#   auto_init = true
# }


output "terraform-fist-repo-url" {
  value = github_repository.terraform-fist-repo.html_url
}