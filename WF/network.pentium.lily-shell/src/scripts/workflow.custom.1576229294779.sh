#!/bin/bash
# This is Pentium Shell Script Sample
echo "Parameters in below:"
while (( "$#" )); do 
  echo $1 
  shift 
done
echo "End Echo Parameters"

