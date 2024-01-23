#!/bin/bash

#COLOR CODE
NC='\033[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\033[0;36m'
MB='\e[0;1m'
CB='\e[35;1m'
WB='\e[37;1m'

# Restore User
echo -e "$banner" | lolcat
echo -e "$info"
echo -e "    ${BB}┌───────────────────────────────────────┐${NC}" | lolcat
echo -e "    ${WB}        ──── [ ʀᴇꜱᴛᴏʀᴇ ᴜꜱᴇʀ ] ────        ${NC}" | lolcat
echo -e "    ${BB}└───────────────────────────────────────┘${NC}" | lolcat
echo -e ""
read -p "     ʟɪɴᴋ ʙᴀᴄᴋᴜᴘ : " link
if [[ $link == "" ]]; then
echo ""
echo -e "    ${RB} ʏᴏᴜ ᴘʀᴇꜱꜱᴇᴅ ᴡʀᴏɴɢ${NC}"
menu
fi
sleep 1
echo -e "    ${GB} [ɪɴꜰᴏ] ꜱᴛᴀʀᴛ ʀᴇꜱᴛᴏʀᴇ${NC}"
# Create Restore Folder
mkdir -rp /etc/limit
mkdir -rp /root/.restore
cd /root/.restore
wget -q -O $IP-backup.zip "$link"
unzip $IP-backup.zip > /dev/null 2>&1
# Restore SSH
cp -r /root/.restore/ssh/passwd /etc/passwd  &> /dev/null
cp -r /root/.restore/ssh/group /etc/group  &> /dev/null
cp -r /root/.restore/ssh/shadow /etc/shadow  &> /dev/null
cp -r /root/.restore/ssh/gshadow /etc/gshadow  &> /dev/null
# Restore Xray
cp -r /root/.restore/xray/config.json /usr/local/etc/xray/config.json  &> /dev/null
rm -rf /var/www/html/ssh
rm -rf /var/www/html/vmess
rm -rf /var/www/html/vless
rm -rf /var/www/html/trojan
cp -r /root/.restore/html/ssh /var/www/html/ &> /dev/null
cp -r /root/.restore/html/vmess /var/www/html/ &> /dev/null
cp -r /root/.restore/html/vless /var/www/html/ &> /dev/null
cp -r /root/.restore/html/trojan /var/www/html/ &> /dev/null
cp -r /root/.restore/vmess /etc/ &> /dev/null
cp -r /root/.restore/vless /etc/ &> /dev/null
cp -r /root/.restore/trojan /etc/ &> /dev/null
cp -r /root/.restore/limit/vmess /etc/limit/ &> /dev/null
cp -r /root/.restore/limit/vless /etc/limit/ &> /dev/null
cp -r /root/.restore/limit/trojan /etc/limit/ &> /dev/null

# Restart Service
systemctl restart ssh
systemctl restart xray
echo -e "    ${GB} [ɪɴꜰᴏ] ꜱᴜᴄᴄᴇꜱꜱ ʀᴇꜱᴛᴏʀᴇ${NC}"
sleep 1

clear
cd 
rm -rf /root/.restore > /dev/null 2>&1
echo -e "$banner" | lolcat
echo -e "$info"
echo -e "    ${BB}┌───────────────────────────────────────┐${NC}" | lolcat
echo -e "    ${WB}        ──── [ ʀᴇꜱᴛᴏʀᴇ ᴜꜱᴇʀ ] ────        ${NC}" | lolcat
echo -e "    ${BB}└───────────────────────────────────────┘${NC}" | lolcat
echo -e "    ${GB}           ꜱᴜᴄᴄᴇꜱꜱ ʀᴇꜱᴛᴏʀᴇᴅ ᴜꜱᴇʀ           ${NC}"
echo -e "    ${BB} ────────────────────────────────────────${NC}" | lolcat
echo -e ""
read -n 1 -s -r -p "     ᴘʀᴇꜱꜱ ᴀɴʏ ᴋᴇʏ ᴛᴏ ʙᴀᴄᴋ ᴏɴ ᴍᴇɴᴜ"
menu
