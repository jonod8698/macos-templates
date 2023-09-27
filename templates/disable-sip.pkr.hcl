packer {
  required_plugins {
    tart = {
      version = ">= 1.2.0"
      source  = "github.com/cirruslabs/tart"
    }
  }
}

variable "vm_name" {
  type = string
  default = "ventura-sip-disabled"
}

source "tart-cli" "tart" {
  vm_name      = "${var.vm_name}"
  recovery     = true
  cpu_count    = 4
  memory_gb    = 8
  disk_size_gb = 50
  communicator = "none"
  boot_command = [
    # Skip over "Macintosh" and select "Options"
    # to boot into macOS Recovery
    "<wait60s><right><right><enter>",
    # Select default language
    "<wait10s><enter>",
    # Open Terminal
    "<wait5s><leftCtrlOn><f2><leftCtrlOff>",
    "<right><right><right><right><down><down><down><enter>",
    # Disable SIP
    "<wait5s>csrutil disable<enter>",
    "<wait5s>admin<enter>",
    # Shutdown
    "<wait5s>halt<enter>"
  ]
}

build {
  sources = ["source.tart-cli.tart"]
}
