#!/bin/bash

echo "---------------------"
echo "Create group"
# 建立群組
groupadd mgtdata
# 顯示群組資料
grep mgtdata /etc/passwd /etc/shadow /etc/group

echo "---------------------"
echo "Create normal user for management data folder"
# 建立一般用戶
useradd -G mgtdata -c "managenemt data user" tuser1
useradd -G mgtdata -c "managenemt data user" tuser2
useradd -c "normal user" tuser3
# 顯示群組資料
grep mgtdata /etc/passwd /etc/shadow /etc/group

echo "---------------------"
echo "Create data folder"
# 建立資料目錄
mkdir -p /var/data
# 修改目錄管理群組
chgrp mgtdata /var/data
# 修改目錄權限
chmod ug=rwx,o= /var/data
# 顯示群組資料
ls -ld /var/data

# 測試動作
echo "---------------------"
echo "Test create file in data folder"
su -c "id && touch /var/data/f1" tuser1
su -c "id && touch /var/data/f2" tuser2
su -c "id && touch /var/data/f3" tuser3

# 以下測試請手動輸入
bash
