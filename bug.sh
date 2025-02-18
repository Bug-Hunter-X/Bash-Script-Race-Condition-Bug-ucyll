#!/bin/bash

# This script demonstrates a race condition bug.
# Two processes try to update a shared counter simultaneously.

counter=0

# Process 1
process1() {
  local i
  for i in {1..1000}; do
    let counter+=1
  done
}

# Process 2
process2() {
  local i
  for i in {1..1000}; do
    let counter+=1
  done
}

# Run processes concurrently
process1 & 
process2 & 

wait # Wait for both processes to finish

echo "Final counter value: $counter"