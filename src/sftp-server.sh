echo "---------------------"
echo "Create SFTP data directory"
# 建立檔案與目錄
mkdir -p /data
chmod ug=rwx,o=rx /data

echo "---------------------"
echo "Create SFTP group and user"
groupadd sftpusers
useradd -g sftpusers -d /data/sftp -s /bin/bash sftpuser
echo sftpuser:12345678 | chpasswd

echo "---------------------"
echo "Create a directory for the file transfer."
mkdir -p /data/sftp
chown -R root:sftpusers /data
chown -R sftpuser:sftpusers /data/sftp

echo "---------------------"
echo "Setting sshd_config."
echo "Match group sftp" | tee -a /etc/ssh/sshd_config
echo "ForceCommand internal-sftp" | tee -a /etc/ssh/sshd_config

echo "---------------------"
echo "Start server."
service ssh start

echo "---------------------"
echo "Infinity slepp."
sleep infinity
