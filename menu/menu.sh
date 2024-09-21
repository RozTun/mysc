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
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
MYIP=$(curl -sS ipv4.icanhazip.com)

url_izin=https://raw.githubusercontent.com/RozTun/permission/main/ip
# USERNAME
rm -f /usr/bin/user
username=$(curl -sS $url_izin | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl -sS $url_izin | grep $MYIP | awk '{print $3}')
echo "$valid" > /usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
# Status ExpiRED Active
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}(Registered)${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl -sS $url_izin | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
status_ws="${COLOR1}[RUN]${NC}"
else
status_ws="${RED}[OFF]${NC}"
fi
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
status_nginx="${COLOR1}[RUN]${NC}"
else
status_nginx="${RED}[OFF]${NC}"
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
status_xray="${COLOR1}[RUN]${NC}"
else
status_xray="${RED}[OFF]${NC}"
fi

uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`

clear
clear && clear && clear
clear;clear;clear
echo -e " $COLOR1 •──────────────────────────────────────────────•${NC}"
echo -e " $COLOR1│${NC} ${COLBG1}              ${WH} • HUNTER TUNNEL•               ${NC} $COLOR1│$NC"
echo -e " $COLOR1 •──────────────────────────────────────────────•${NC}"
echo -e " $COLOR1 •──────────────────────────────────────────────•${NC}"
echo -e " $COLOR1│$NC${WH} • OS     ${COLOR1}: ${WH}$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')${NC}"
echo -e " $COLOR1│$NC${WH} • RAM    ${COLOR1}: ${WH}$uram MB / $tram MB${NC}"
echo -e " $COLOR1│$NC${WH} • ISP    ${COLOR1}: ${WH}$ISP${NC}"
echo -e " $COLOR1│$NC${WH} • City   ${COLOR1}: ${WH}$CITY${NC}"
echo -e " $COLOR1│$NC${WH} • IP VPS ${COLOR1}: ${WH}$MYIP${NC}"
echo -e " $COLOR1│$NC${WH} • DOMAIN ${COLOR1}: ${WH}$(cat /etc/xray/domain)"
echo -e " $COLOR1│$NC${WH} • UPTIME ${COLOR1}: ${WH}$uphours $upminutes $uptimecek"
echo -e " $COLOR1│$NC${WH} • DATE   ${COLOR1}: ${WH}$DATE2 WIB${NC}"
#echo -e " $COLOR1│$NC${WH} • NSDomain      ${COLOR1}: ${WH}$(cat /etc/xray/dns)"
echo -e " $COLOR1 •──────────────────────────────────────────────•${NC}"
echo -e " $COLOR1 •──────────────────────────────────────────────•${NC}"
echo -e " $COLOR1│  ${WH} SSH WS : $status_ws ${WH} NGINX : $status_nginx ${WH} XRAY : $status_xray  ${COLOR1}│$NC"
echo -e " $COLOR1 •──────────────────────────────────────────────•${NC}"
echo -e " $COLOR1 •──────────────────────────────────────────────•${NC}"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}SSH-WS  ${WH}[${COLOR1}Menu${WH}] ${NC}$COLOR1│ ${NC}${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}BOT AKUN ${WH}[${COLOR1}Menu${WH}] ${COLOR1}│$NC"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}VMESS   ${WH}[${COLOR1}Menu${WH}] ${NC}$COLOR1│ ${NC}${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}UPDATE   ${WH}[${COLOR1}Menu${WH}] ${COLOR1}│$NC"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}VLESS   ${WH}[${COLOR1}Menu${WH}] ${NC}$COLOR1│ ${NC}${WH}[${COLOR1}08${WH}]${NC} ${COLOR1}• ${WH}BACKUP   ${WH}[${COLOR1}Menu${WH}] ${COLOR1}│$NC"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}TROJAN  ${WH}[${COLOR1}Menu${WH}] ${NC}$COLOR1│ ${NC}${WH}[${COLOR1}09${WH}]${NC} ${COLOR1}• ${WH}SYSTEM   ${WH}[${COLOR1}Menu${WH}] ${COLOR1}│$NC"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}RUNNING ${WH}[${COLOR1}Menu${WH}] ${NC}$COLOR1│ ${NC}${WH}[${COLOR1}10${WH}]${NC} ${COLOR1}• ${WH}REBOOT   ${WH}[${COLOR1}Menu${WH}] ${COLOR1}│$NC"
echo -e " $COLOR1 •──────────────────────────────────────────────•${NC}"
echo -e " $COLOR1 •──────────────────────────────────────────────•${NC}"
echo -e " $COLOR1│$NC ${WH} • Versi   ${NC}: ${WH}3.0 LTS ${NC}$COLOR1"
echo -e " $COLOR1│$NC ${WH} • Client ${NC} : ${WH}$(cat /usr/bin/user)${NC}"
echo -e " $COLOR1│$NC ${WH} • Durasi ${NC} : ${WH}$certifacate hari lagi $sts${NC}$COLOR1"
echo -e " $COLOR1 •──────────────────────────────────────────────•${NC}"
echo ""
echo -ne " ${WH}Select menu => ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; m-sshovpn ;;
02 | 2) clear ; m-vmess ;;
03 | 3) clear ; m-vless ;;
04 | 4) clear ; m-trojan ;;
05 | 5) clear ; running ;;
06 | 6) clear ; m-bot ;;
07 | 7) clear ; m-update  ;;
08 | 8) clear ; m-backup ;;
09 | 9) clear ; m-system ;;
10 | 10) clear ; reboot ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
