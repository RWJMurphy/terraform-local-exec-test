resource "random_id" "random" {
  keepers = {
    uuid = uuid()
  }

  byte_length = 12

  provisioner "local-exec" {
      command = "pip install awscli"
  }
}

output "random" {
  value = random_id.random.hex
}
