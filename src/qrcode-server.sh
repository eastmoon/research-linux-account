echo "---------------------"
echo "Create group and user"
groupadd qrusers
useradd -g qrusers -m -s /bin/bash qruser
echo qruser:12345678 | chpasswd

echo "---------------------"
echo "QRCode generate and show image"
cat > /home/qruser/start << EOF
info="http://www.google.com?\$(date +%s)"
echo -----------------------------
echo \${info}
echo -----------------------------
qrencode -s 1 -m 1 -v 1 -o ~/output \${info}
catimg ~/output
exit 1
EOF

echo "---------------------"
echo "Setting non-login user will run startup script"
echo "source ~/start" | tee -a /home/qruser/.bashrc

echo "---------------------"
echo "Setting sshd_config. Make sure ssh login user will run startup script"
cat > /etc/ssh/sshd_config.d/qrusers.conf << EOF
Match group qrusers
    ForceCommand /bin/bash /home/qruser/start
EOF

echo "---------------------"
echo "Start server."
service ssh start

echo "---------------------"
echo "Infinity slepp."
sleep infinity
