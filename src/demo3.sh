#!/bin/bash

echo "---------------------"
echo "Create normal user and home directory"
# 建立應用程式管理的一般用戶
useradd -c "mgt application user" -s /bin/bash -m appuser
# 建立測試應用程式的一般用戶
useradd -c "test application user" -s /bin/bash testuser
# 顯示用戶家目錄
ls -ld /home/appuser

echo "---------------------"
echo "Create app script"
# 建立並設定應用程式腳本
su -c "touch ~/app.sh" appuser
echo "echo hello world!!" | tee /home/appuser/app.sh
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
echo "echo hello world!!!!!!!!!!" | tee /usr/local/app.sh
chmod ug=rwx,o=rx /usr/local/app.sh
# 顯示應用程式資訊
ls -ld /usr/local/app.sh

echo "---------------------"
echo "Create common app link"
# 建立軟連結至應用程式腳本
ln -s /usr/local/app.sh /usr/bin/app2
# 顯示連結資訊
ls -ld /usr/bin/app2

# 測試動作
echo "---------------------"
echo "Test app1"
app1
su -c "app1" appuser
su -c "app1" testuser
echo "---------------------"
echo "Test app2"
app2
su -c "app2" appuser
su -c "app2" testuser

# 以下測試請手動輸入
bash
