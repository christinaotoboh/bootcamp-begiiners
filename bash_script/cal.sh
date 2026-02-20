
#!/bin/bash

# Function to get numbers

echo "To add, enter +"
echo "To subtract, enter -"

add(){
SUM=$((num + num2))
echo $SUM
}

subtract(){
SUBTRACT=$((num - num2))
echo $SUBTRACT
}

echo "enter num1:"
read num
echo "enter num2:"
read num2

read -p "enter an operation (+ or -):" CHOICE

case $CHOICE in
+) 
  add # run the add function
  ;;
-) 
  subtract #run the subtract function
  ;;
*) 
  echo "Invalid operand"
  ;;
esac







