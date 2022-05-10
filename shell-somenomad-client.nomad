job "shell-some-noamdclient" {
  region      = "cn-seoul"
  datacenters = ["cn-dc"]

  type = "batch"
  
  constraint {
    attribute = meta.type
    value     = "webserver"
  }

  group "install-package" {
    task "install-package" {
      driver = "raw_exec"
      template { 
        data        = <<EOH
#!/bin/bash
mkdir -p /tmp/bbb
yum install -y httpd
    EOH
        destination = "install-rpm.sh"
      }
      config {
        command = "install-rpm.sh"
      }
       resources {
         memory = 128
         cpu    = 100
       }	      
    }
  }
}