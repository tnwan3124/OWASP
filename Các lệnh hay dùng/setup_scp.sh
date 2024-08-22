#!/bin/bash

sudo apt install -y openssh-server

sudo apt list --installed | grep openssh-server 

sudo service ssh status