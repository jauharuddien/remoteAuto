#! /usr/bin/bash

echo =============================
echo = Auto login ssh dan Telnet =
echo =         J Sofari          =
echo =============================
echo Hai, mau remote tapi males bikin scrpit auto loginnya?
echo Silahkan di isi :
read -p 'Hostname : ' hostname
read -p 'Address : ' host
read -p 'Username : ' user
read -sp 'Password : ' pass
echo \n
echo Mau pake protokol apa?
echo 1. Telnet
echo 2. SSH
read -p 'Pilih : ' pilih 
echo Remote file sedang di buat untuk $hostname
echo Done !!!!

if [[ $pilih = 1 ]]
then
cat << EOF >> $hostname.sh
#!/usr/bin/expect -f
spawn telnet $host
expect -re "login"
send "$user\n"
expect -re "Password"
send "$pass\n"
interact
EOF
else
cat << EOF >> $hostname.sh
#!/usr/bin/expect -f
spawn ssh $user@$host
expect -re "$user@$host's password"
send "$pass\n"
interact
EOF
fi

chmod +x $hostname.sh
