#!/bin/bash

figlet -f big "IPSWEEP"
# Function to calculate IP range based on subnet mask
calculate_range() {
    local mask=$1
    case $mask in
        24) echo "1 254" ;;
        25) echo "1 126" ;;
        26) echo "1 62" ;;
        27) echo "1 30" ;;
        28) echo "1 14" ;;
        29) echo "1 6"  ;;
        30) echo "1 2"  ;;
        *) echo "Invalid subnet mask. Supported: /24 to /30"; exit 1 ;;
    esac
}


if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <subnet> <CIDR>"
    echo "Example: $0 192.168.1 24"
    exit 1
fi

subnet="$1"
cidr="$2"


range=$(calculate_range "$cidr")
start_ip=$(echo "$range" | cut -d ' ' -f1)
end_ip=$(echo "$range" | cut -d ' ' -f2)

echo "Scanning subnet: ${subnet}.0/${cidr} (IPs: ${start_ip} to ${end_ip})"

for ip in $(seq "$start_ip" "$end_ip"); do
    ping -c 1 -W 1 "${subnet}.${ip}" | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done

wait
echo "Scan completed."

