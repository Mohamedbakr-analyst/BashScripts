#!/bin/bash

# A function to generate a random password
generate_password() {
  # The length of the password
  local LENGTH=$1
  # The complexity of the password
  local COMPLEXITY=$2
  # The characters to use for the password
  local CHARS=""
  # Add lowercase letters to the characters
  CHARS="${CHARS}abcdefghijklmnopqrstuvwxyz"
  # If the complexity is 2 or higher, add uppercase letters
  if [ $COMPLEXITY -ge 2 ]; then
    CHARS="${CHARS}ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  fi
  # If the complexity is 3 or higher, add digits
  if [ $COMPLEXITY -ge 3 ]; then
    CHARS="${CHARS}0123456789"
  fi
  # If the complexity is 4 or higher, add symbols
  if [ $COMPLEXITY -ge 4 ]; then
    CHARS="${CHARS}!@#$%^&*()-_=+[{]};:,<.>/?"
  fi
  # Loop through the length and append a random character
  local PASSWORD=""
  for ((i=0; i<LENGTH; i++)); do
    # Get a random index from 0 to the length of the characters
    local INDEX=$((RANDOM % ${#CHARS}))
    # Append the character at the index to the password
    PASSWORD="${PASSWORD}${CHARS:INDEX:1}"
  done
  # Echo the password
  echo $PASSWORD
}

# Check if the user provided two arguments
if [ $# -eq 2 ]; then
  # Get the length and complexity from the arguments
  local LENGTH=$1
  local COMPLEXITY=$2
  # Check if the length is a positive integer
  if [[ $LENGTH =~ ^[1-9][0-9]*$ ]]; then
    # Check if the complexity is between 1 and 4
    if [[ $COMPLEXITY =~ ^[1-4]$ ]]; then
      # Generate and print the password
      generate_password $LENGTH $COMPLEXITY
    else
      # Print an error message for invalid complexity
      echo "Invalid complexity. Please enter a number between 1 and 4."
    fi
  else
    # Print an error message for invalid length
    echo "Invalid length. Please enter a positive integer."
  fi
else
  # Print a usage message for missing arguments
  echo "Usage: $0 <length> <complexity>"
  echo "Length: The number of characters in the password."
  echo "Complexity: The level of complexity of the password."
  echo "1: Lowercase letters only."
  echo "2: Lowercase and uppercase letters."
  echo "3: Lowercase, uppercase, and digits."
  echo "4: Lowercase, uppercase, digits, and symbols."
fi
