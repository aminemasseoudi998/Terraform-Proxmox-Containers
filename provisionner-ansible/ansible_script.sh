#!/bin/bash
      sudo apt update 
      sudo apt upgrade -y 
      sudo apt install -y curl
      sudo apt install openjdk-11-jdk -y
      sudo apt install -y software-properties-common
      sudo apt repository -y ppa:ansible/ansible
      sudo apt install -y ansible
      ansible --version
