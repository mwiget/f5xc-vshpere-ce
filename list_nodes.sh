#!/bin/bash
terraform output -json | jq -r '.[].value[][] | { name:  .name, ip: .default_ip_address}' 
