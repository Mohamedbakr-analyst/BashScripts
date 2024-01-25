#!/bin/bash

# 1. Write a script that takes a file path as input and displays information about the file, such as its size, type, and permissions.


read -p "Enter the file path "  file
if [ -f "$file" ]
then 
	ls -l $file
else 
	echo "sorry, you should Enter a file name or path"
fi
