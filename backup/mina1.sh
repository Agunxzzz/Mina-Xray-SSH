#!/bin/bash
# // config Data
echo -e "${GREEN}Config Data${NC}"
wget -q -O /usr/local/bin/mina "https://raw.githubusercontent.com/Agunxzzz/Mina-Xray-SSH/main/backup/mina"
echo "tulis token botnya"
read token
sed -i -e s/initoken/"$token"/g /usr/local/bin/mina
echo "tulis user idnya"
read userid
sed -i -e s/iniid/"$userid"/g /usr/local/bin/mina
chmod 755 /usr/local/bin/mina
sed -i '/backup1/d' /etc/crontab
echo "2 23 * * * root mina backup" >> /etc/crontab
service cron restart
