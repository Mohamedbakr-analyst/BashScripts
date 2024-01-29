#!/bin/bash

# Check if a file name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 domains.txt"
  exit 1
fi

# Check if the file exists and is readable
if [ ! -f "$1" ] || [ ! -r "$1" ]; then
  echo "Invalid file: $1"
  exit 2
fi

# Check if the number of iterations is provided as an argument
if [ -z "$2" ]; then
  echo "Usage: $0 domains.txt 2"
  exit 3
fi

# Check if the number of iterations is a positive integer
if ! [[ "$2" =~ ^[0-9]+$ ]] || [ "$2" -lt 1 ]; then
  echo "Invalid number of iterations: $2"
  exit 4
fi

# Set the output file name
output="subdomains.txt"

# Initialize the input file name
input="$1"

# Loop for the number of iterations
for i in $(seq 1 "$2"); do
  # Create a temporary file name
  temp="temp_$i.txt"
#!/bin/bash

# Check if a file name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 domains.txt"
  exit 1
fi

# Check if the file exists and is readable
if [ ! -f "$1" ] || [ ! -r "$1" ]; then
  echo "Invalid file: $1"
  exit 2
fi

# Check if the number of iterations is provided as an argument
if [ -z "$2" ]; then
  echo "Usage: $0 domains.txt 2"
  exit 3
fi

# Check if the number of iterations is a positive integer
if ! [[ "$2" =~ ^[0-9]+$ ]] || [ "$2" -lt 1 ]; then
  echo "Invalid number of iterations: $2"
  exit 4
fi

# Set the output file name
output="subdomains.txt"

# Initialize the input file name
input="$1"

# Loop for the number of iterations
for i in $(seq 1 "$2"); do
  # Create a temporary file name
  temp="temp_$i.txt"


  while read -r domain; do
    subfinder -d "$domain" -silent >> "$temp"
  done < "$input"

  # Sort and remove duplicates from the temporary file
  sort -u "$temp" > "$temp.sorted"

  # Set the input file name to the sorted temporary file for the next iteration
  input="$temp.sorted"
done

# Move the final output file to the desired name
mv "$input" "$output"

# Count the number of unique subdomains
count=$(wc -l < "$output")

# Print the result
echo "Found $count subdomains. Saved to $output"

  while read -r domain; do
    subfinder -d "$domain" -silent >> "$temp"
  done < "$input"

  # Sort and remove duplicates from the temporary file
  sort -u "$temp" > "$temp.sorted"

  # Set the input file name to the sorted temporary file for the next iteration
  input="$temp.sorted"
done

# Move the final output file to the desired name
mv "$input" "$output"

# Count the number of unique subdomains
count=$(wc -l < "$output")

# Print the result
echo "Found $count subdomains. Saved to $output"
