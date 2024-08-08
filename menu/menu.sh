#!/bin/bash
Green="\e[92;1m"
RED="\033[1;31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
BG_BLU="\033[44;1m" # BG BIRU
export COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
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

vmess=$(grep -c -E "^#vmg " "/etc/xray/config.json")
vless=$(grep -c -E "^#vlg " "/etc/xray/config.json")
trtls=$(grep -c -E "^#trg " "/etc/xray/config.json")
total_ssh=$(grep -c -E "^### " "/etc/xray/ssh")

# // ROZ STORE TUNNELING
# // WHATSAPP : 085759375937
# // TELEGRAM : @RozTun

clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐\033[0m "
echo -e "$COLOR1│\e[0m ${COLBG1}                 ${WH}HUNTER-TUNNEL                 \033[0m $COLOR1│\e[0m"
echo -e "$COLOR1└─────────────────────────────────────────────────┘\033[0m "
echo -e "$COLOR1┌─────────────────────────────────────────────────┐\033[0m "
echo -e "$COLOR1│\e[97m OS     : $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')     \033[0m "
echo -e "$COLOR1│\e[97m RAM    : $(free -m | awk 'NR==2 {print $2}') / $(free -m | awk 'NR==2 {print $3}') MB   \033[0m "
echo -e "$COLOR1│\e[97m CITY   : $(cat /etc/xray/city)    \033[0m "
echo -e "$COLOR1│\e[97m ISP    : $(cat /etc/xray/isp)    \033[0m "
echo -e "$COLOR1│\e[97m IP     : $(curl -s ipv4.icanhazip.com)     \033[0m "
echo -e "$COLOR1│\e[97m DOMAIN : $(cat /etc/xray/domain)    \033[0m "
echo -e "$COLOR1│\e[97m UPTIME : $(uptime -p | cut -d " " -f 2-10)\033[0m "
echo -e "$COLOR1└─────────────────────────────────────────────────┘\033[0m"
echo -e "    $COLOR1╔═════════════════════════════════════════════════╗${NC}"
echo -e "    $COLOR1║ $NC ${WH}[ SSH WS : ${status_ws} ${WH}]  ${WH}[ XRAY : ${status_xray} ${WH}]  ${WH}[ NGINX : ${status_nginx} ${WH}]$COLOR1 ║$NC"
echo -e "    $COLOR1╚═════════════════════════════════════════════════╝${NC}"
echo -e "    $COLOR1╔═════════════════════════════════════════════════╗${NC}"
echo -e "    $COLOR1║ ${WH} ${WH}SSH       VMESS         VLESS        TROJAN   $NC $COLOR1║ $NC"
echo -e "    $COLOR1║ ${WH} ${WH} ${COLOR1}$total_ssh${WH}          ${COLOR1}$vmess${WH}             ${COLOR1}$vless${WH}            ${COLOR1}${trtls}${WH}      $NC $COLOR1║ $NC"
echo -e "    $COLOR1╚═════════════════════════════════════════════════╝${NC}"
echo -e " $COLOR1╔═════════════════════ • LIST MENU • ════════════════════╗${NC}"
echo -e " $COLOR1║$NC ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}SSH-WS    ${WH}[${COLOR1}Menu${WH}]   ${NC} $COLOR1║${NC}  ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}BOT AKUN   ${WH}[${COLOR1}Menu${WH}] $COLOR1║${NC}"
echo -e " $COLOR1║$NC ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}VMESS     ${WH}[${COLOR1}Menu${WH}]   ${NC} $COLOR1║${NC}  ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}UPDATE     ${WH}[${COLOR1}Menu${WH}] $COLOR1║${NC}"    
echo -e " $COLOR1║$NC ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}VLESS     ${WH}[${COLOR1}Menu${WH}]   ${NC} $COLOR1║${NC}  ${WH}[${COLOR1}08${WH}]${NC} ${COLOR1}• ${WH}SYSTEM     ${WH}[${COLOR1}Menu${WH}] $COLOR1║${NC}"   
echo -e " $COLOR1║$NC ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}TROJAN    ${WH}[${COLOR1}Menu${WH}]   ${NC} $COLOR1║${NC}  ${WH}[${COLOR1}09${WH}]${NC} ${COLOR1}• ${WH}BACKUP     ${WH}[${COLOR1}Menu${WH}] $COLOR1║${NC}" 
echo -e " $COLOR1║$NC ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}RUNNING   ${WH}[${COLOR1}Menu${WH}]   ${NC} $COLOR1║${NC}  ${WH}[${COLOR1}10${WH}]${NC} ${COLOR1}• ${WH}REBOOT     ${WH}[${COLOR1}Menu${WH}] $COLOR1║${NC}" 
echo -e " $COLOR1╚════════════════════════════════════════════════════════╝${NC}"
echo -e "         $COLOR1╔═════════════════════════════════════════╗${NC}"
echo -e "         $COLOR1║$NC      ${WH}Versi  ${NC}: ${WH}$(cat /opt/.ver) ${NC}$COLOR1"
echo -e "         $COLOR1║$NC      ${WH}Client${NC} : ${WH}$author${NC}"
echo -e "         $COLOR1║$NC      ${WH}Durasi${NC} : ${WH}$(((d1 - d2) / 86400)) Day${NC}$COLOR1"
echo -e "         $COLOR1╚═════════════════════════════════════════╝${NC}"
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