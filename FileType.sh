#!/bin/bash
# A script to extract and display metadata and analyze various file types in a directory

# Check if a directory is given as an argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 directory"
  exit 1
fi

# Loop through all files in the directory
for file in $1/*; do
  # Get the file type using the file command
  filetype=$(file -b \"$file\")
  echo "File: $file"
  echo "Type: $filetype"

  # Use different tools based on the file type
  case $filetype in
    *JPEG*)
      # Use ExifTool to show EXIF information
      exiftool \"$file\"
      ;;
    *PNG*)
      # Use pngtools to show PNG information
      pngcheck -v \"$file\"
      ;;
    *PCAP*)
      # Use tcpdump to show network traffic
      tcpdump -r \"$file\"
      ;;
    *ASCII*)
      # Use strings to show printable characters
      strings \"$file\"
      ;;
    *)
      # Unknown file type
      echo "No tool available for this file type"
      ;;
  esac

  # Add a separator line
  echo "----------------------------------------"
done
