#!/bin/bash

function function1 {
	# Function to Convert into 32 bit integer
	local array=("$@")
	local sum=0
	for ((i=0;i<4;i++)); do
		if [[ $i == 0 ]]; then
			sum=$(( sum + ( array[0] << 24 ) ))
		elif [[ $i == 1 ]]; then
			sum=$(( sum + ( array[1] << 16 ) ))
		elif [[ $i == 2 ]]; then
			sum=$(( sum + ( array[2] << 8 ) ))
		elif [[ $i == 3 ]]; then 
			sum=$(( sum + array[3] ))
		fi
	done
	echo $sum;
}

function function2 {
	# Function to Convert 32 bit integer back into ip address
	local val=$1
	array[0]=$(( ( val >> 24 ) & 255 ))
	array[1]=$(( ( val >> 16 ) & 255 ))
	array[2]=$(( ( val >> 8 ) & 255 ))
	array[3]=$(( val & 255 ))
	echo "${array[0]}.${array[1]}.${array[2]}.${array[3]}"
}

read -p "Please enter the IP address: " ipadr
read -p "Please enter the subnet mask: " submsk

# echo "IP Address= $ipadr and Subnet Mask= $submsk";

# Putting the ip address into array as octets
for ((i=1;i<=4;i++)); do
	iparray[$((i-1))]=$(echo "$ipadr" | awk -F '.' -v field=$i '{print $field}')
	# echo "${iparray[$((i-1))]}";
done

# Putting the subnet mask into array as octets
for ((i=1;i<=4;i++)); do
	submaskarray[$((i-1))]=$(echo "$submsk" | awk -F '.' -v field=$i '{print $field}')
	# echo "${submaskarray[$((i-1))]}";
done

# Converting ip address into 32 bit integer
ogip32bit=$(function1 "${iparray[@]}")
# echo "og IP 32bit: $ogip32bit";

# Converting Subnet mask into 32 bit integer
submask32bit=$(function1 "${submaskarray[@]}")
# echo "Og sub mask: $submask32bit";


network=$(( ogip32bit & submask32bit ))
broadcast=$(( network | (~submask32bit & 0xFFFFFFFF) ))

trap "echo -e '\nInterrupted! Exiting...'; exit 1" SIGINT

for ((i=$network+1;i<broadcast;i++)); do
    hostip=$(function2 "$i")
    # lastip=$(function2 "$broadcast")
    echo $hostip
    ping -c 1 $hostip
done

# firstip=$(function2 "$network")
# lastip=$(function2 "$broadcast")
# echo "$firstip $lastip"
