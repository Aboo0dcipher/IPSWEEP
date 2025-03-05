IPSweep - A Simple Subnet Scanner

📌 Overview
IPSweep is a simple and efficient Bash script that scans a given subnet for active IP addresses using ping. After completing the scan, it displays "IPSWEEP" in a large ASCII format using figlet.

⚡ Features
✅ Scans a subnet based on a given CIDR (Classless Inter-Domain Routing) range

✅ Supports subnet masks /24 to /30

✅ Uses parallel processing for fast scanning

✅ Displays "IPSWEEP" in large ASCII text after scanning

✅ Simple, lightweight, and easy to use

🛠 Installation
1️⃣ Install Required Packages
Before running the script, ensure you have figlet installed:


sudo apt install figlet    # Debian/Ubuntu  
sudo yum install figlet    # CentOS/RHEL  
brew install figlet        # macOS  

2️⃣ Clone the Repository

git clone https://github.com/Aboo0dcipher/IPSWEEP.git
cd IPSweep  
chmod +x ipsweep.sh  
🚀 Usage
Run the script with a subnet and CIDR range:


./ipsweep.sh <subnet> <CIDR>
🔹 Example:

./ipsweep.sh 192.168.1 24
This will scan the IP range 192.168.1.1 to 192.168.1.254.

📜 Output Example


 _____ _____   _______          ________ ______ _____  
|_   _|  __ \ / ____\ \        / /  ____|  ____|  __ \ 
  | | | |__) | (___  \ \  /\  / /| |__  | |__  | |__) |
  | | |  ___/ \___ \  \ \/  \/ / |  __| |  __| |  ___/ 
 _| |_| |     ____) |  \  /\  /  | |____| |____| |     
|_____|_|    |_____/    \/  \/   |______|______|_|  




Scanning subnet: 192.168.1.0/24 (IPs: 1 to 254)
192.168.1.1 
192.168.1.100 
Scan completed.

 
🔧 How It Works
The script extracts the IP range from the given CIDR value.
It uses ping to check if an IP is online.
Results are processed in parallel for efficiency.
Once the scan is done, "IPSWEEP" is displayed in a large ASCII font using figlet.
❗ Notes
The script requires root/admin privileges if your system restricts ICMP requests.
Ensure your firewall allows ICMP (ping) requests for proper results.
Works on Linux & macOS (Windows users can use WSL).
