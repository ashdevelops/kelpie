SSH_USER="root"
SSH_HOST="192.168.1.207"
SUPPORT_PATH="/Library/Application\ Support/Kelpie"

echo "[*] Deleting old resources..."
ssh ${SSH_USER}@${SSH_HOST} "rm -R /Library/Application\ Support/Kelpie" >/dev/null

echo "[*] Copying latest resources..."
scp -r "Kelpie" ${SSH_USER}@${SSH_HOST}:/Library/Application\ Support/Kelpie >/dev/null

echo "[*] Running package install..."
cd source
make package install >/dev/null

echo "[*] Respringing..."
sleep 10

echo "[!] Package has been installed!";
