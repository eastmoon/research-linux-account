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
echo "Change normal user password ( 12345678 )"
# 變更 testuser 用戶的密碼為 12345678
echo testuser:12345678 | chpasswd

echo "---------------------"
echo "Change user for test, systemuser to testuser need input password"
su -c "id && su -c 'id' testuser" systemuser

# 以下測試請手動輸入
bash
