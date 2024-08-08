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
colornow="default_color"  # Pastikan variabel ini terdefinisi

export COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"

MYIP=$(curl -sS ipv4.icanhazip.com)

# Hapus file sebelumnya
rm -f /usr/bin/user
username=$(curl -sS https://raw.githubusercontent.com/RozTun/permission/main/ip | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
rm -f /usr/bin/e
valid=$(curl -sS https://raw.githubusercontent.com/RozTun/permission/main/ip | grep $MYIP | awk '{print $3}')
echo "$valid" > /usr/bin/e

clear

# Periksa hari yang tersisa
today=$(date +%Y-%m-%d)
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
days_left=$(((d1 - d2) / 86400))

# Periksa status layanan
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# Tentukan status
status_ssh=$(if [[ $ssh_service == "running" ]]; then echo -e "\033[92;1mON${NC}"; else echo -e "\033[91;1mOFF${NC} "; fi)
ssh_ws=$(systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
status_ws=$(if [[ $ssh_ws == "running" ]]; then echo -e "\033[92;1mON${NC}"; else echo -e "\033[91;1mOFF${NC} "; fi)
status_haproxy=$(if [[ $haproxy_service == "running" ]]; then echo -e "\033[92;1mON${NC}"; else echo -e "\033[91;1mOFF${NC} "; fi)
status_xray=$(if [[ $xray_service == "running" ]]; then echo -e "\033[92;1mON${NC}"; else echo -e "\033[91;1mOFF${NC} "; fi)
status_nginx=$(if [[ $nginx_service == "running" ]]; then echo -e "\033[92;1mON${NC}"; else echo -e "\033[91;1mOFF${NC} "; fi)
status_dropbear=$(if [[ $dropbear_service == "running" ]]; then echo -e "\033[92;1mGOOD${NC}"; else echo -e "\033[91;1mCRAZY${NC} "; fi)

# Hitung jumlah pengguna
vmess=$(grep -c -E "^#vmg " "/etc/xray/config.json")
vless=$(grep -c -E "^#vlg " "/etc/xray/config.json")
trtls=$(grep -c -E "^#trg " "/etc/xray/config.json")
total_ssh=$(grep -c -E "^### " "/etc/xray/ssh")

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
echo -e "$COLOR1│\e[97m UPTIME : $(uptime -p | cut -d ' ' -f 2-10)\033[0m "
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
echo -e "         $COLOR1║$NC      ${WH}Client${NC} : ${WH}$username${NC}"
echo -e "         $COLOR1║$NC      ${WH}Durasi${NC} : ${WH}$days_left Day${NC}$COLOR1"
echo -e "         $COLOR1╚═════════════════════════════════════════╝${NC}"
echo
read -p "Select From option [1-10 or x] :  " hallo
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
x) clear ; exit ;;
*) clear ; menu ;;
esac