# Bash Script Race Condition

This repository demonstrates a common race condition bug in a bash script. Two processes increment a shared counter concurrently, resulting in an incorrect final count due to data races.

## Bug Description
The script uses two concurrent processes to increment a counter. Without proper synchronization, the final counter value may be less than expected because the processes might overwrite each other's updates.

## Solution
The solution employs a lock mechanism using a file to ensure only one process can access and modify the counter at a time.