#!/bin/bash
#monstermash
# Create 10 1GB text files
for i in {1..10}; do
  filename="file_$i.txt"
  touch "$filename"
  truncate -s 1G "$filename"
done

# Search for files greater than 5GB and fill them with zeros
find . -type f -size +5G -exec dd if=/dev/zero of={} bs=1M \;
