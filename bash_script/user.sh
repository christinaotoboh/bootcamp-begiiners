#!/bin/bash
# Get user Inputs: Name and Surname
# Use this to create a user with username -  namesurname@devopsclass.com
# Assign the user sudo rights and display their name, surname and email

# Collect user data
  read -p "Please enter your first Name: " FIRST
  read -p "Please enter your surame: " SURNAME
 
  if [ -z "$FIRST" ] || [ -z "$SURNAME" ]; then
    echo "A name field is missing, Names cannot be blank" 
    exit
  fi

DOMAIN=@devopsclass.com
EMAIL="$FIRST$SURNAME$DOMAIN"
# create user in the /etc/passwd file
#Assign user to sudo group
sudo useradd -mNG sudo $EMAIL 
echo "Your name is: $FIRST"
echo "Your surname is: $SURNAME"
echo "Your email address is: $EMAIL"












