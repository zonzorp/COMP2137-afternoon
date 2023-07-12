#!/bin/bash
# created may 17 by dennis to perform a system update task for the the lab

# update the software cache in case it is needed
sudo apt update
# upgrade using new software package versions
sudo apt upgrade -y

