resource "random_id" "random" {
  keepers = {
    uuid = uuid()
  }

  byte_length = 12

  provisioner "local-exec" {
      command = "python3 -m venv myenv; python3 ./test.py"
  }
}

output "random" {
  value = random_id.random.hex
}
