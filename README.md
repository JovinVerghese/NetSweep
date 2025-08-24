# 🌐 NetSweep

NetSweep is a lightweight **ping sweeper written in Bash**.  
It takes any **IP address** and its **subnet mask**, calculates the **network range** (first and last usable IP), and automatically pings every host in between.  

---

## ✨ Features
- 🔢 Converts IPs and subnet masks into 32-bit integers for easier calculation  
- 📡 Finds **network address**, **broadcast address**, and usable host range  
- 🖧 Pings each host in the subnet range  
- ⏹️ Handles interruptions gracefully (Ctrl + C exits safely)
- 📝 Includes **comments** for easier code understanding and debugging

---

## 📦 Requirements
Make sure you have the following installed:
- `bash` (default on Linux/macOS)  
- `ping`  
- `awk`  

---

## 🚀 Installation & Usage

```bash
# Clone the repository
git clone https://github.com/your-username/netsweep.git
cd netsweep

# Make the script executable
chmod +x netsweep.sh

# Run the tool
./netsweep.sh
