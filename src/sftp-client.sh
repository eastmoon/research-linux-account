echo "---------------------"
echo "Show SFTP server directory"
source /sftp  ls

echo "---------------------"
echo "Create test data and upload"
[ ! -d /data/upload ] && mkdir -p /data/upload
touch /data/upload/1234
source /sftp u 1234

echo "---------------------"
echo "Show SFTP upload result"
source /sftp  ls

echo "---------------------"
echo "Download test data."
[ ! -d /data/download ] && mkdir -p /data/download
source /sftp d 1234
ls -ld /data/download/1234

# 以下測試請手動輸入
bash
