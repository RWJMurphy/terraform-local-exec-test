locals {
  commands = {
    # Exploratory / investigating
    env: "env",
    python_env: "python3 -c 'import sys; print(sys.path);'"

    # Tests
    git: "git --version",
    ssh: "ssh -V",
    curl: "curl --version",
    wget: "wget --version",
    jq: "jq --version",
    unzip: "unzip -v",
    ping: "ping -V",
    pip: "pip --version",
    python3: "python3 --version",
    mercurial: "hg version",
    aws: "aws --version",
  }
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
