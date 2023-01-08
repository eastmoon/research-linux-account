#!/bin/bash

echo "---------------------"
echo "Create group"
# 建立群組
groupadd mgtdata
# 顯示群組資料
grep mgtdata /etc/passwd /etc/shadow /etc/group

echo "---------------------"
echo "Create normal user and home directory"
# 建立應用程式管理的一般用戶
useradd -G mgtdata -c "mgt application user" -s /bin/bash -m appuser
# 建立測試應用程式的一般用戶
useradd -G mgtdata -c "test application user" -s /bin/bash testuser
# 顯示用戶家目錄
ls -ld /home/appuser

echo "---------------------"
echo "Create app script"
# 建立並設定應用程式腳本
su -c "touch ~/app.sh" appuser
cat << EOF > /home/appuser/app.sh
for i in {1..10}
do
    sleep 1
    echo "appuser write \${i}" >> /var/data/raw
done
EOF
chmod ug=rwx /home/appuser/app.sh
# 顯示應用程式資訊
ls -ld /home/appuser/app.sh

echo "---------------------"
echo "Create app link"
# 建立軟連結至應用程式腳本
ln -s /home/appuser/app.sh /usr/bin/app1
# 顯示連結資訊
ls -ld /usr/bin/app1

echo "---------------------"
echo "Create common app script"
# 建立並設定應用程式腳本
touch /usr/local/app.sh
cat << EOF > /usr/local/app.sh
for i in {1..5}
do
    sleep 2
    echo "common write \${i}" >> /var/data/raw
done
EOF
chmod ug=rwx,o=rx /usr/local/app.sh
# 顯示應用程式資訊
ls -ld /usr/local/app.sh

echo "---------------------"
echo "Create common app link"
# 建立軟連結至應用程式腳本
ln -s /usr/local/app.sh /usr/bin/app2
# 顯示連結資訊
ls -ld /usr/bin/app2

echo "---------------------"
echo "Create common data"
# 建立檔案與目錄
mkdir -p /var/data
touch /var/data/raw
chgrp -R mgtdata /var/data
chmod -R ug=rwx,o=rx /var/data
# 顯示資料檔資訊
ls -ld /var/data
ls -ld /var/data/raw

# 測試動作
echo "---------------------"
echo "Test app1 and app2 writing to /var/data/raw"
echo "Ctrl + C for exit"
su -c "app1 &" appuser
app2 &
su -c "tail -f /var/data/raw" testuser
# 以下測試請手動輸入
