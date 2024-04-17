echo "---------------------"
echo ""
sshpass -p ${QR_PASSWORD} ssh -oStrictHostKeyChecking=no ${QR_SERVER}
