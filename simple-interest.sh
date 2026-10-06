#!/bin/bash

# Simple Interest Calculator
# Formula: Simple Interest = (Principal * Rate * Time) / 100

echo "=== Simple Interest Calculator ==="

read -p "Enter the principal amount: " principal
read -p "Enter the rate of interest (%): " rate
read -p "Enter the time period (in years): " time

# Validate that all inputs are numbers
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $principal =~ $re ]] || ! [[ $rate =~ $re ]] || ! [[ $time =~ $re ]]; then
  echo "Error: please enter valid positive numbers."
  exit 1
fi

# Calculate simple interest (bc handles decimals)
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total=$(echo "scale=2; $principal + $interest" | bc)

echo "Principal:       $principal"
echo "Rate:            $rate%"
echo "Time:            $time years"
echo "Simple Interest: $interest"
echo "Total Amount:    $total"
