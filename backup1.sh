#!/bin/bash
# Get date and time

DATE=$(date +"%m-%d-%y")
domain=$(cat /etc/xray/domain)
BOT_TOKEN="initoken"
CHAT_ID="iniid"
file_path="/var/lib/marzban/db.sqlite3"

rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/xray backup/xray
cd /root
zip -r backup.zip backup > /dev/null 2>&1
# Function to send a message to Telegram
# send_message() {
#  local message="$1"
#  curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
#  -d "chat_id=$CHAT_ID" \
#  -d "text=$message"
# }
# send_message "Hi I'm your bot to send files.. UPLOADING here…"
# echo " "
# echo "_____________________________________"
# echo " "
# echo " ${RED} Message Sent ${STD}"
# echo "_____________________________________"
# echo " "
# echo " ${ON_BLUE} Uploading to Telegram${STD}"
# echo " "
# echo " "
 
# Function to send a file to Telegram
send_file() {
 local file_path="/root/backup.zip"
 local caption="$2"
 curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendDocument" \
 -F "chat_id=$CHAT_ID" \
 -F "document=@$file_path" \
 -F "caption=$caption"
}
send_file "$1" "Backup $domain $DATE" > /dev/null
echo " ${ON_BLUE} File Upload Complete ${STD}"
