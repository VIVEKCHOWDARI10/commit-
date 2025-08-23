 #! /bin/bash

 echo " bash calculator "
 echo "operators supported "
 echo " + : addition "
 echo " - :subtraction "
 echo " \* : multiplication "
 echo " / : division "
 echo "% : modulus"
 echo "^ : power"
 echo "---------------------------------"
  

# Function to validate number input
number() {
    local n
    while true; do
        read -p "$1" n
        if [[ $n =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
            echo $n    # Return the valid number
            return
        else
            echo "Invalid number! Please re-enter."
        fi
    done
}

# Function to validate operator input
operator() {
    local op
    while true; do
        read -p "$1" op
        if [[ $op =~ ^(\+|-|\*|/|%|\^)$ ]]; then
            echo $op   # Return the valid operator
            return
        else
            echo "Invalid operator! Please re-enter."
        fi
    done
}

# Read inputs
num1=$(number "Enter the first number: ")
op=$(operator "Enter the operator (+, -, *, /, %, ^): ")
num2=$(number "Enter the second number: ")

# Perform calculation
case $op in
    +) result=$(echo "$num1 + $num2" | bc -l) ;;
    -) result=$(echo "$num1 - $num2" | bc -l) ;;
    \*) result=$(echo "$num1 * $num2" | bc -l) ;;
    /) 
        if [[ $num2 == 0 ]]; then
            echo "Error: Division by zero!"
            exit 1
        fi
        result=$(echo "scale=4; $num1 / $num2" | bc -l) ;;
    %) 
        if [[ $num2 == 0 ]]; then
            echo "Error: Modulo by zero!"
            exit 1
        fi
        result=$(echo "$num1 % $num2" | bc) ;;
    \^) result=$(echo "$num1 ^ $num2" | bc -l) ;;
esac

echo "Result: $result"
 
 

