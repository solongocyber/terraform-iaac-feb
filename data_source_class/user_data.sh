#!/bin/bash
"sudo yum install serverbackup-enterprise -y",
"serverbackup-setup --user r1softteam3 --pass team3project",
"serverbackup-setup --http-port 26080 --https-port 26443",
"/etc/init.d/cdp-server restart",