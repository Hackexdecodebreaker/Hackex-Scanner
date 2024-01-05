#!/bin/bash

echo "Hackex Subdomain Scanner"
echo "------------------------"

if [ $# -eq 0 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi
read -t 10000 -p "Domain:" domain

echo "Listing subdomains for $domain:"

# Install sublist3r if not installed
if ! command -v sublist3r &> /dev/null; then
    echo "sublist3r is not installed. Installing..."
    git clone https://github.com/aboul3la/Sublist3r.git
    cd Sublist3r
    pip install -r requirements.txt
    cd ..
fi

# Run sublist3r
sublist3r -d $domain -o subdomains.txt

# Display the result
cat subdomains.txt

# Cleanup
rm subdomains.txt
