#!/bin/bash

echo "---------------------"
echo "Create normal user"
# 建立一般用戶
useradd -u 1500 -g users -s /bin/bash -m testuser
# 顯示用戶家目錄
ls -d /home/testuser
# 顯示設定檔中的用戶資訊
grep testuser /etc/passwd /etc/shadow /etc/group

echo "---------------------"
echo "Create system user"
# 建立系統用戶
useradd -s /bin/bash -r systemuser
# 顯示用戶家目錄，但系統用戶不會強制建立家目錄
ls -d /home/systemuser
# 顯示設定檔中的用戶資訊
grep systemuser /etc/passwd /etc/shadow /etc/group

echo "---------------------"
echo "Change normal user password"
echo testuser:12345678 | chpasswd

bash
# 以下測試請手動輸入
# 切換至新增系統用戶
# su systemuser
# 顯示帳號資訊
# id
# 切換至一般用戶
# 因為前面設定的密碼，會需要輸入密碼才可登入
# su testuser
# 顯示帳號資訊
# id 
