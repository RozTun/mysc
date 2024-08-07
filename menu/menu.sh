#!/bin/bash
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
MYIP=$(curl -sS ipv4.icanhazip.com)
colornow=$(cat /etc/rmbl/theme/color.conf)
export NC="\e[0m"
export yl='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
MYIP=$(curl -sS ipv4.icanhazip.com)
Isadmin=$(curl -sS https://raw.githubusercontent.com/RozTun/permission/main/ip | grep $MYIP | awk '{print $5}')
Exp2=$(curl -sS https://raw.githubusercontent.com/RozTun/permission/main/ip | grep $MYIP | awk '{print $3}')
export RED='\033[0;31m'
export GREEN='\033[0;32m'
Name=$(curl -sS https://raw.githubusercontent.com/RozTun/permission/main/ip | grep $MYIP | awk '{print $2}')
ipsaya=$(curl -sS ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/RozTun/permission/main/ip"
checking_sc() {
useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
systemctl stop nginx
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •                 ${NC}$COLOR1│ $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│            ${RED}PERMISSION DENIED !${NC}                  $COLOR1│"
echo -e "$COLOR1│   ${yl}Your VPS${NC} $ipsaya \033[0;36mHas been Banned ${NC}      $COLOR1│"
echo -e "$COLOR1│     ${yl}Buy access permissions for scripts${NC}          $COLOR1│"
echo -e "$COLOR1│             \033[0;32mContact Your Admin ${NC}                 $COLOR1│"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
key
fi
}
MODEL2=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
status_ws="${COLOR1}ON${NC}"
else
status_ws="${RED}OFF${NC}"
fi
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
status_nginx="${COLOR1}ON${NC}"
else
status_nginx="${RED}OFF${NC}"
systemctl start nginx
fi
if [[ -e /usr/bin/kyt ]]; then
nginx=$( systemctl status kyt | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
echo -ne
else
systemctl start kyt
fi
fi
rm -rf /etc/status
xray=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
status_xray="${COLOR1}ON${NC}"
else
status_xray="${RED}OFF${NC}"
fi
# // Dropbear
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $dropbear_status == "running" ]]; then
   status_beruangjatuh="${COLOR1}ON${NC}"
else
   status_beruangjatuh="${RED}OFF${NC}"
fi
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}(Registered)${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"
today=$(date -d "0 days" +"%Y-%m-%d")
if [[ $today < $Exp2 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
vmess=$(grep -c -E "^#vmg " "/etc/xray/config.json")
vless=$(grep -c -E "^#vlg " "/etc/xray/config.json")
trtls=$(grep -c -E "^#trg " "/etc/xray/config.json")
total_ssh=$(grep -c -E "^### " "/etc/xray/ssh")
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`

clear
clear && clear && clear
clear;clear;clear
echo -e " $COLOR1╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " $COLOR1│${NC} ${COLBG1}                 ${WH} • HUNTER TUNNELING •                  ${NC} $COLOR1│ $NC"
echo -e " $COLOR1╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " $COLOR1╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " $COLOR1│$NC${WH} ❈ OS          ${COLOR1}: ${WH}$MODEL2${NC}"
echo -e " $COLOR1│$NC${WH} ❈ RAM         ${COLOR1}: ${WH}$tram / $uram MB${NC}"
echo -e " $COLOR1│$NC${WH} ❈ DATE        ${COLOR1}: ${WH}$DATE2 WIB${NC}"
echo -e " $COLOR1│$NC${WH} ❈ UPTIME      ${COLOR1}: ${WH}$uphours $upminutes $uptimecek"
echo -e " $COLOR1│$NC${WH} ❈ ISP         ${COLOR1}: ${WH}$ISP${NC}"
echo -e " $COLOR1│$NC${WH} ❈ City        ${COLOR1}: ${WH}$CITY${NC}"
echo -e " $COLOR1│$NC${WH} ❈ IP VPS      ${COLOR1}: ${WH}$MYIP${NC}"
echo -e " $COLOR1│$NC${WH} ❈ DOMAIN      ${COLOR1}: ${WH}$(cat /etc/xray/domain)"
echo -e " $COLOR1╰══════════════════════════════════════════════════════════╯${NC}"
echo -e "    $COLOR1╭═════════════════ • ${NC}${WH}STATUS SERVER${NC}${COLOR1} • ═══════════════╮${NC}"
echo -e "     ${WH} SSH WS : ${status_ws} ${WH} XRAY : ${status_xray} ${WH} NGINX : ${status_nginx} ${WH} DROPBEAR : ${status_beruangjatuh}$NC"
echo -e "    $COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e "        $COLOR1╭════════════════════════════════════════════╮${NC}"
printf "                \033[1;37m%-16s ${COLOR1}%-4s${NC} ${WH}%-5s\e[0m\n" " SSH/OPVPN   =" "$total_ssh" "ACCOUNT "
printf "                \033[1;37m%-16s ${COLOR1}%-4s${NC} ${WH}%-5s\e[0m\n" " VMESS/WS    =" "$vmess" "ACCOUNT "
printf "                \033[1;37m%-16s ${COLOR1}%-4s${NC} ${WH}%-5s\e[0m\n" " VLESS/WS    =" "$vless" "ACCOUNT "
printf "                \033[1;37m%-16s ${COLOR1}%-4s${NC} ${WH}%-5s\e[0m\n" " TROJAN/GRPC =" "$trtls" "ACCOUNT "
echo -e "        $COLOR1╰═════════════════════════════════════════════╯${NC}"
echo -e " $COLOR1╭══════════════════════ • ${WH}LIST MENU${NC}${COLOR1} • ═════════════════════╮${NC}"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}SSH-WS    ${WH}[${COLOR1}Menu${WH}]    ${NC} $COLOR1│${NC}  ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}BOT AKUN   ${WH}[${COLOR1}Menu${WH}] $COLOR1 │${NC}"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}VMESS     ${WH}[${COLOR1}Menu${WH}]    ${NC} $COLOR1│${NC}  ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}UPDATE     ${WH}[${COLOR1}Menu${WH}] $COLOR1 │${NC}"    
echo -e " $COLOR1│$NC ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}VLESS     ${WH}[${COLOR1}Menu${WH}]    ${NC} $COLOR1│${NC}  ${WH}[${COLOR1}08${WH}]${NC} ${COLOR1}• ${WH}SYSTEM     ${WH}[${COLOR1}Menu${WH}] $COLOR1 │${NC}"   
echo -e " $COLOR1│$NC ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}TROJAN    ${WH}[${COLOR1}Menu${WH}]    ${NC} $COLOR1│${NC}  ${WH}[${COLOR1}09${WH}]${NC} ${COLOR1}• ${WH}BACKUP     ${WH}[${COLOR1}Menu${WH}] $COLOR1 │${NC}" 
echo -e " $COLOR1│$NC ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}RUNNING   ${WH}[${COLOR1}Menu${WH}]    ${NC} $COLOR1│${NC}  ${WH}[${COLOR1}10${WH}]${NC} ${COLOR1}• ${WH}REBOOT     ${WH}[${COLOR1}Menu${WH}] $COLOR1 │${NC}" 
echo -e " $COLOR1╰══════════════════════════════════════════════════════════╯${NC}"
DATE=$(date +'%Y-%m-%d')
datediff() {
d1=$(date -d "$1" +%s)
d2=$(date -d "$2" +%s)
echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}

d1=$(date -d "$Exp2" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
domain=$(cat /etc/xray/domain)


echo -e " $COLOR1╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " $COLOR1│$NC ${WH} ❈ Versi   ${NC}: ${WH}$(cat /opt/.ver) ${NC}$COLOR1"
echo -e " $COLOR1│$NC ${WH} ❈ Client ${NC} : ${WH}$author${NC}"
echo -e " $COLOR1│$NC ${WH} ❈ Durasi ${NC} : ${WH}$certificate hari${NC}$COLOR1"
echo -e " $COLOR1│$NC ${WH} ❈ Expiry ${NC} : ${WH}$Exp2 $sts ${NC}$COLOR1"
echo -e " $COLOR1╰══════════════════════════════════════════════════════════╯${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
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