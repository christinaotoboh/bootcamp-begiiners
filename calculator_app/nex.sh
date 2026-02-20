#!/bin/bash

################################################################################
# Interactive Calculator
# Performs basic arithmetic operations
################################################################################

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
# NC='\033[0m'

# Functions
add() {
    echo $(($1 + $2))
}

subtract() {
    echo $(($1 - $2))
}

multiply() {
    echo $(($1 * $2))
}

divide() {
    if [ $2 -eq 0 ]; then
        echo "Error: Division by zero"
        return 1
    fi
    echo $(($1 / $2))
}

modulo() {
    echo $(($1 % $2))
}

power() {
    echo $(($1 ** $2))
}

show_menu() {
    clear
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}        CALCULATOR${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
    echo "1) Addition (+)"
    echo "2) Subtraction (-)"
    echo "3) Multiplication (×)"
    echo "4) Division (÷)"
    echo "5) Modulo (%)"
    echo "6) Power (^)"
    echo "7) Exit"
    echo ""
}

get_numbers() {
    while true; do
        read -p "Enter first number: " NUM1
        if [[ "$NUM1" =~ ^-?[0-9]+$ ]]; then
            break
        else
            echo -e "${RED}Invalid number! Try again.${NC}"
        fi
    done
    
    while true; do
        read -p "Enter second number: " NUM2
        if [[ "$NUM2" =~ ^-?[0-9]+$ ]]; then
            break
        else
            echo -e "${RED}Invalid number! Try again.${NC}"
        fi
    done
}

# Main loop
while true; do
    show_menu
    read -p "Enter choice (1-7): " CHOICE
    
    case $CHOICE in
        1)
            echo -e "${YELLOW}--- Addition ---${NC}"
            get_numbers
            RESULT=$(add $NUM1 $NUM2)
            echo -e "${GREEN}$NUM1 + $NUM2 = $RESULT${NC}"
            ;;
        2)
            echo -e "${YELLOW}--- Subtraction ---${NC}"
            get_numbers
            RESULT=$(subtract $NUM1 $NUM2)
            echo -e "${GREEN}$NUM1 - $NUM2 = $RESULT${NC}"
            ;;
        3)
            echo -e "${YELLOW}--- Multiplication ---${NC}"
            get_numbers
            RESULT=$(multiply $NUM1 $NUM2)
            echo -e "${GREEN}$NUM1 × $NUM2 = $RESULT${NC}"
            ;;
        4)
            echo -e "${YELLOW}--- Division ---${NC}"
            get_numbers
            RESULT=$(divide $NUM1 $NUM2)
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}$NUM1 ÷ $NUM2 = $RESULT${NC}"
            fi
            ;;
        5)
            echo -e "${YELLOW}--- Modulo ---${NC}"
            get_numbers
            RESULT=$(modulo $NUM1 $NUM2)
            echo -e "${GREEN}$NUM1 % $NUM2 = $RESULT${NC}"
            ;;
        6)
            echo -e "${YELLOW}--- Power ---${NC}"
            get_numbers
            RESULT=$(power $NUM1 $NUM2)
            echo -e "${GREEN}$NUM1 ^ $NUM2 = $RESULT${NC}"
            ;;
        7)
            echo -e "${GREEN}Thank you for using Calculator!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice!${NC}"
            ;;
    esac
    
    echo ""
    read -p "Press Enter to continue..."
done