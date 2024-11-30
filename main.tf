provider "local" {}

# Create a local directory
resource "local_file" "example_file" {
  filename = "E:\DevOps NewFlow\example_file"
  content  = "Hello, Terraform! This is a local file."
}

# Ensure the directory exists before creating the file
resource "null_resource" "create_directory" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/example_directory"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

