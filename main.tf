locals {
  commands = [
    "git --version",
    "ssh -V",
    "curl --version",
    "wget --version",
    "jq --version",
    "unzip -v",
    "ping -V",
    "pip --version",
    "python --version",
    "python3 --version",
    "hg version",
    "aws --version",
  ]
}
resource "terraform_data" "exec" {
  for_each = local.commands

  triggers_replace = [
    uuid()
  ]
  provisioner "local-exec" {
      command = each.value
  }
}

output "exec" {
  value = {
    for c in local.local.commands : c => terraform_data.exec[c]
  }
}
