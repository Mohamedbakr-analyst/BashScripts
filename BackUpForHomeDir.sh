#!/bin/bash

# Write a script that automate backups for /home directory 

sudo rsync -avz /home /home_backup

echo "Process is done Successfully"
