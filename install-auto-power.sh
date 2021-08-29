# w8 LA < 1 & turn watchdog off to start by cmd: sudo bash /hive-config/install-auto-power.sh
sudo mkdir /auto-power/ # 
sudo chmod 777 /auto-power # 
sudo mkdir /auto-power/logs/ # 
sudo chmod 777 /auto-power/logs # 
sudo apt-get update # 
sudo apt-get install -y samba --install-recommends # 
sudo apt-get update # 
sudo apt-get install -y wget apt-transport-https # 
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb # 
sudo dpkg -i packages-microsoft-prod.deb # 
rm packages-microsoft-prod.deb # 
sudo apt-get update # 
#sudo apt-get install -y dotnet-runtime-5.0 # 
sudo apt-get install -y dotnet-runtime-3.1 #
sudo apt-get update # 
sudo net usershare add auto-power /auto-power "auto-power" everyone:F guest_ok=y # 
# 
