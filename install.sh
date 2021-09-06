apt-get update
apt-get upgrade -y
##Download script
wget https://raw.githubusercontent.com/tunneler123/sshplus/master/script.py
##Screen
apt-get install screen -y
##dropbearsetup
apt-get install dropbear -y
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=442/g' /etc/default/dropbear
service dropbear restart
##python install
apt-get install python -y
##SSL
apt-get -y install stunnel4
wget -O /etc/stunnel/stunnel.pem "https://raw.githubusercontent.com/tunneler123/sslgtm/main/stunnel.pem"
wget -O /etc/stunnel/stunnel.conf "https://raw.githubusercontent.com/tunneler123/sslgtm/main/stunnel.conf"
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
service stunnel4 restart
###Work
chmod a+x script.py
cd /usr/bin
wget -O account https://raw.githubusercontent.com/tunneler123/sshplus/master/account.sh
screen -dmS screen python ./script.py
cat <<EOF >>start
screen -dmS screen python /root/script.py
EOF
cat <<EOF >>stop
pkill python
EOF
chmod +x start
chmod +x stop
chmod +x account
###TUNNELER###
clear
echo -e "\e[1;32m PHTUNNELER AUTOSCRIPT \e[0m"
echo -e "\e[1;32m SSH INSTALLED DONE \e[0m"
echo -e "\e[1;32m DEFAULT WS PORT IS 80 \e[0m"
echo -e "\e[1;32m DEFAULT SSL PORT IS 443 \e[0m"
echo -e "\e[1;32m type "account" to add user \e[0m"
