#!/bin/bash
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIRU='\033[1;94m'       # Blue
BAYS='\033[1;95m'     # Purple
AYG='\033[1;96m'       # Cyan
PUTIH='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
NILA='\033[0;95m'      # Purple
ZIL='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
export sem=$( curl -s https://raw.githubusercontent.com/tridebleng/permission/main/versions)
export pak=$( cat /home/.ver)
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 

BURIQ () {
    curl -sS https://raw.githubusercontent.com/tridebleng/permission/main/ipmini > /root/tmp
    data=( `cat /root/tmp | grep -E "^#tr# " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^#tr# $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/tridebleng/permission/main/ipmini | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/tridebleng/permission/main/ipmini | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
echo -e " \e[32m┌───────────────────────────────────────┐${NC}" | lolcat
echo -e "       $green     AKSES VPS DI TOLAK "  
echo -e "        HUBUNGI ADMIN ARTA MAULANA " 
echo -e "             WA:/083162336146 "  
echo -e "            TELEGRAM:/Arta1ove"  $NC
echo -e " \e[32m└───────────────────────────────────────┘${NC}" | lolcat
exit 0
fi

red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/tridebleng/permission/main/ipmini | grep $MYIP | awk '{print $3}')
fi

DATE=$(date +'%d %B %Y')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
#  echo -e " ${z}│${NC}${z}Expiry Script $blue=${NC} ( ${r}$(( (d1 - d2) / 86400 )) ${NC}Days ) $NC"
}
mai="datediff "$Exp" "$DATE""  

    datediff "$Exp" "$DATE"

if [ "$Isadmin" = "Pro" ]; then
uis="${GREEN} ┌───────────────────────────────────────┐
   ꜱᴄʀɪᴘᴛ : ᴘʀᴇᴍɪᴜᴍ        ᴠᴇʀꜱɪᴏɴ : $pak
   ᴜꜱᴇʀ   : $Name         ꜱᴛᴀᴛᴜꜱ
   ᴇxᴘɪʀᴇ : $habis       $update
 └───────────────────────────────────────┘ $NC"
else
uis="${BIGreen} ┌───────────────────────────────────────┐$NC
   ꜱᴄʀɪᴘᴛ :${BIGreen} ᴘʀᴇᴍɪᴜᴍ      ${ZIL} ᴠᴇʀꜱɪᴏɴ :${BIRU} $sem $pak $NC
   ᴜꜱᴇʀ   : ${BIYellow}$Name  $NC ${ZIL} ꜱᴛᴀᴛᴜꜱ  : ${BIRU}ON $NC
   ᴇxᴘɪʀᴇ : ${BIRed}$(( (d1 - d2) / 86400 )) 𝙳𝙰𝚈 𝙻𝙴𝙵𝚃 $NC      $update
 ${BIGreen}└───────────────────────────────────────┘ $NC"
fi

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
    cd /usr/bin
rm -fr menu
rm -fr /usr/sbin/menu
rm -fr /usr/local/bin/menu
wget https://raw.githubusercontent.com/tridebleng/ali/main/menu.zip
unzip -o menu.zip
chmod +x *
rm -fr menu.zip
}
netfilter-persistent
clear
echo -e "$uis"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m          UPDATE SCRIPT arta Vpn       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "  \033[1;91m update script service\033[1;37m"
fun_bar
res1
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu

###########- COLOR CODE -##############
