#!/bin/bash
#monstermash
# Create 100 2GB text files
for i in {1..100}; do
  filename="file_$i.txt"
  touch "$filename"
  truncate -s 2G "$filename"
done
sleep 10
# Search for files greater than 1GB and fill them with zeros
find . -type f -name "*.txt" -size +1G -exec dd if=/dev/zero of={} bs=1M \;
