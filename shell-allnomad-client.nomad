job "shell-all-noamdclient" {
  region      = "cn-seoul"
  datacenters = ["cn-dc"]

  type = "sysbatch"
  
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