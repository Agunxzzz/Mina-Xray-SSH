wget https://raw.githubusercontent.com/Agunxzzz/Mina-Xray-SSH/main/backup1.sh
chmod 755 backup1.sh
echo "tulis token botnya"
read token
sed -i -e s/initoken/"$token"/g /root/backup1.sh
echo "tulis user idnya"
read userid
sed -i -e s/iniid/"$userid"/g /root/backup1.sh

echo "2 23 * * * root /root/backup1.sh" >> /etc/crontab
service cron restart
