#!/bin/bash

# Update without the kernal update
yum update -y --exclude=kernal

# Tools install nano git unzip and screen
yum install -y nano git unzip screen