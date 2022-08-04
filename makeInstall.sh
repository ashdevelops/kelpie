echo "[*] Copying resources..."
scp -r "KelpieSupport" root@192.168.1.207:"/Library/Application Support/KelpieSupport"

echo "[*] Compiling deb and installing..."
make package install >/dev/null

echo "[!] Waiting for respring to complete..."
sleep 8

echo "[!] Everything has been done :)";