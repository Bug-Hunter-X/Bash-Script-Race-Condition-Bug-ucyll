#!/bin/bash

# This script demonstrates a solution to the race condition bug.
# It uses a lock file to ensure mutual exclusion when accessing the counter.

counter=0
lockfile="counter.lock"

# Process 1
process1() {
  local i
  for i in {1..1000}; do
    flock -x "$lockfile" # Acquire exclusive lock
    let counter+=1
    flock -u "$lockfile" # Release lock
  done
}

# Process 2
process2() {
  local i
  for i in {1..1000}; do
    flock -x "$lockfile" # Acquire exclusive lock
    let counter+=1
    flock -u "$lockfile" # Release lock
  done
}

# Run processes concurrently
process1 & 
process2 & 

wait # Wait for both processes to finish

echo "Final counter value: $counter"

rm -f "$lockfile"