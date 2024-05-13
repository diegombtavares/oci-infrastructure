locals {
  certificates = { for v in fileset("${path.root}/../saltstack/srv/configs/certificates/ssl", "**") : split("/", v)[0] => split("/", v)[1]  }
  }