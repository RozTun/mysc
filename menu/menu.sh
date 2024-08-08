#!/bin/bash
Green="\e[92;1m"
RED="\033[1;31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
BG_BLU="\033[44;1m" # BG BIRU
NC='\e[0m'
MYIP=$(curl -sS ipv4.icanhazip.com)
######################################
#IPVPS=$(curl -s ipv4.icanhazip.com)
#ISP=$(cat /etc/xray/isp)
#CITY=$(cat /etc/xray/city)
#domain=$(cat /etc/xray/domain)
#RAM=$(free -m | awk 'NR==2 {print $2}')
#MODEL=$(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g')

#uptime="$(uptime -p | cut -d " " -f 2-10)"
#cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
#cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
#cpu_usage+=" %"
# // Gettings Info

######################################
# // USERNAME IZIN IPP
rm -f /usr/bin/user
username=$(curl -sS https://raw.githubusercontent.com/RozTun/permission/main/ip | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
rm -f /usr/bin/e
valid=$(curl -sS https://raw.githubusercontent.com/RozTun/permission/main/ip | grep $MYIP | awk '{print $3}')
echo "$valid" > /usr/bin/e

clear
######################################
# // DETAIL ORDER IZIN IP
#username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
######################################
clear
# // DAYS LEFT
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
#certifacate=$(((d1 - d2) / 86400))
clear
######################################
# // GETTINGS SYSTEM
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

clear
######################################
# // RUNNING SSH
######################################
if [[ $ssh_service == "running" ]]; then 
   status_ssh="\033[92;1mON${NC}"
else
   status_ssh="\033[91;1mOFF${NC} "
fi
######################################
# // RUNNING WEBSOCKET
######################################
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="\033[92;1mON${NC}"
else
    status_ws_epro="\033[91;1mOFF${NC} "
fi
######################################
# RUNNING HAPROXY
######################################
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="\033[92;1mON${NC}"
else
   status_haproxy="\033[91;1mOFF${NC} "
fi
######################################
# RUNNING XRAY
######################################
if [[ $xray_service == "running" ]]; then 
   status_xray="\033[92;1mON${NC}"
else
   status_xray="\033[91;1mOFF${NC} "
fi
######################################
# RUNNING NGINX
######################################
if [[ $nginx_service == "running" ]]; then 
   status_nginx="\033[92;1mON${NC}"
else
   status_nginx="\033[91;1mOFF${NC} "
fi
######################################
# RUNNING DROPBEAR
######################################
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="\033[92;1mGOOD${NC}"
else
   status_dropbear="\033[91;1mCRAZY${NC} "
fi

# \\ Vless account //
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
# \\ Vmess account //
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
# \\ Trojan account //
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
# \\ shadowsocks account //
ssx=$(grep -c -E "^#!# " "/etc/xray/config.json")
let ssa=$ssx/2

# // ROZ STORE TUNNELING
# // WHATSAPP : 085759375937
# // TELEGRAM : @RozTun


function Newbie_Banner() {
clear
echo -e "$YELLOW┌─────────────────────────────────────────────────┐\033[0m "
echo -e "$YELLOW│\e[0m $BG_BLU                 \e[97mHUNTER-TUNNEL                 \033[0m $YELLOW│\e[0m"
echo -e "$YELLOW└─────────────────────────────────────────────────┘\033[0m "
}



function Service_System_Operating() {
echo -e "$YELLOW┌─────────────────────────────────────────────────┐\033[0m "
echo -e "$YELLOW│\e[97m OS     : $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')     \033[0m "
echo -e "$YELLOW│\e[97m RAM    : $(free -m | awk 'NR==2 {print $2}') / $(free -m | awk 'NR==2 {print $3}') MB   \033[0m "
echo -e "$YELLOW│\e[97m CITY   : $(cat /etc/xray/city)    \033[0m "
echo -e "$YELLOW│\e[97m ISP    : $(cat /etc/xray/isp)    \033[0m "
echo -e "$YELLOW│\e[97m IP     : $(curl -s ipv4.icanhazip.com)     \033[0m "
echo -e "$YELLOW│\e[97m DOMAIN : $(cat /etc/xray/domain)    \033[0m "
echo -e "$YELLOW│\e[97m UPTIME : $(uptime -p | cut -d " " -f 2-10)\033[0m "
echo -e "$YELLOW└─────────────────────────────────────────────────┘\033[0m"
}



function Service_Status() {
echo -e "$YELLOW┌─────────────────────────────────────────────────┐\033[0m "
echo -e "$YELLOW|\e[0m\033[0;36m PROXY :\e[0m $status_haproxy  \e[0m$YELLOW|\033[0;36m NGINX :\e[0m $status_nginx  \e[0m$YELLOW|\033[0;36m X-RAY :\e[0m $status_xray \e[0m$YELLOW|  $status_dropbear  $YELLOW| \e[0m "
echo -e "$YELLOW└─────────────────────────────────────────────────┘\033[0m "
}



function Details_Clients_Name() {
echo -e "$YELLOW   ┌───────────────────────────────────────────┐\033[0m "
echo -e "$YELLOW   │\e[97m  Version     : v3.0 LTS    \033[0m "
echo -e "$YELLOW   │\e[97m  Developer   : @RozTun    \033[0m "
echo -e "$YELLOW   │\e[97m  Order By    : $(cat /etc/profil)    \033[0m "
echo -e "$YELLOW   │\e[97m  Client Name :\033[0m\033[91;1m $(cat /usr/bin/user)      \033[0m "
echo -e "$YELLOW   │\e[97m  Expiry In   :\033[0m\033[91;1m $(((d1 - d2) / 86400)) Day \033[0m "
echo -e "$YELLOW   └───────────────────────────────────────────┘\033[0m "
}



function Acces_Use_Command() {
echo -e "$YELLOW┌─────────────────────────────────────────────────┐\033[0m "
echo -e "$YELLOW│  \033[0;36m[1] \e[97m SSH/OPENVPN         \033[0;36m[6] \e[97m FEATURES         $YELLOW│\e[0m"   
echo -e "$YELLOW│  \033[0;36m[2] \e[97m XRAY MANAGER        \033[0;36m[7] \e[97m UPDATE SCRIPT    $YELLOW│\e[0m"
echo -e "$YELLOW│  \033[0;36m[3] \e[97m XRAY TROJAN         \033[0;36m[8] \e[97m BACKUP/RESTOR    $YELLOW│\e[0m"
echo -e "$YELLOW│  \033[0;36m[4] \e[97m SS-R                \033[0;36m[9] \e[97m ABOUT            $YELLOW│\e[0m"
echo -e "$YELLOW│  \033[0;36m[5] \e[97m BOT TELEGRAM        \e[31m[x] \e[91m EXIT             $YELLOW│\e[0m"
echo -e "$YELLOW└─────────────────────────────────────────────────┘\033[0m"
}



function Select_Display() {
echo
read -p "Select From option [1/9 or x] :  " hallo
case $hallo in
01 | 1) clear ; m-sshovpn ;;
02 | 2) clear ; m-vmess ;;
03 | 3) clear ; m-vless ;;
04 | 4) clear ; m-trojan ;;
05 | 5) clear ; running ;;
06 | 6) clear ; m-bot ;;
07 | 7) clear ; m-update  ;;
08 | 8) clear ; m-system ;;
09 | 9) clear ; m-backup ;;
10 | 10) clear ; reboot ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
}


Newbie_Banner
Service_System_Operating
Service_Status
Details_Clients_Name
Acces_Use_Command
Select_Display







