# 🌐 NetSweep

NetSweep is a lightweight **ping sweeper written in Bash**.  
It takes any **IP address** and its **subnet mask**, calculates the **network range** (first and last usable IP), and automatically pings every host in between.  

---

If you feel like something can be improved, a feature can be added, or the code can be written in a better way — feel free to fork the repo, open a pull request, or suggest changes! 🚀  

---

## ✨ Features
- 🔢 Converts IPs and subnet masks into **32-bit integers** for easier calculation  
- 📡 Finds **network address**, **broadcast address**, and usable host range  
- 🖧 Pings each host in the subnet range  
- ⏹️ Handles interruptions gracefully (**Ctrl + C** exits safely)  
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
git clone https://github.com/JovinVerghese/NetSweep.git
cd NetSweep

# Make the script executable
chmod u+x NetSweep.sh

# Run the tool
./NetSweep.sh
