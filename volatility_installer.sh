#!/usr/bin/env bash   

#Author: T3jv1l                                                                                                                                                                                                                                      #
#Date:   07-03-2019   				
#Contact for bug :t3jv1l@gmail.com>>                                                                                                                                                                                                                                 #



#---Installing dependencies  From Volatility Framework
echo -e "\n\e[01;32m[>]\e[00m Starting the automated Volatility install script.!!"
sleep 0.5
echo -e "\e[01;35m[+]\e[00m Start install libpcre++-dev python-dev "
sleep 2
sudo apt-get install subversion pcregrep libpcre++-dev python-dev -y
sleep 0.5
echo -e "\e[01;32m[+]\e[00m Installation succesful !"
mkdir Volatility_install
cd Volatility_install/
sleep 0.5

#---Installi PyCrypto
echo -e "\e[01;35m[>]\e[00m Start install PyCrypto "
sleep 1
wget https://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/pycrypto-2.6.1.tar.gz
tar -zxvf pycrypto-2.6.1.tar.gz
cd pycrypto-2.6.1/
python setup.py build
sudo python setup.py build install
cd ../
sleep 0.5
echo -e "\e[01;32m[+]\e[00m Installation succesful !"
sleep 0.5

#---Install Distrom3 disassemble library for x86/AMDx64
echo -e "\e[01;35m[>]\e[00m Install Distrom3 disassemble library for x86/AMDx64! "
sleep 2
sudo apt-get install python-setuptools -y
sudo apt-get install python3-setuptools -y 
#sudo apt-get install git ---- if you don't have installed git clone
git clone https://github.com/gdabah/distorm.git
cd distorm/
python setup.py build
sudo python setup.py build install
cd ../
sleep 0.5
echo -e "\e[01;32m[+]\e[00m Installation succesful!"
sleep 0.5

#---Install Yara-project 1.4
echo -e "\e[01;35m[>]\e[00m Install Yara-project 1.4 "
sleep 2
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/yara-project/yara-1.4.tar.gz
tar -zxvf yara-1.4.tar.gz
cd yara-1.4/
sudo ./configure
sudo make
sudo make install
cd ../
sleep 0.5
echo -e "\e[01;32m[+]\e[00m Installation succesful!"
sleep 0.5

#---Install Yara-python 1.4a
echo -e "\e[01;35m[>]\e[00m Install Yara-python1.4a "
sleep 2
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/yara-project/yara-python-1.4a.tar.gz
tar -zxvf yara-python-1.4a.tar.gz
cd yara-python-1.4a/
python setup.py build
sudo python setup.py build install
sleep 1
echo -e "\e[31m[+] We need change permission for move /usr/local/lib >> /etc/ld.so.conf\e[0m"
sleep 0.5
echo -e "\e[01;32m[+]\e[00m Set Permission change! "
sleep 0.5
sudo chmod 777 /etc/ld.so.conf
echo -e "\e[01;32m[+]\e[00m Verified Permission!"
sleep 0.5
ls -la /etc/ld.so.conf | grep "rwx"
sleep 2
sudo echo “/usr/local/lib” >> /etc/ld.so.conf
sudo ldconfig
cd ../
echo -e "\e[01;32m[+]\e[00m Installation succesful !"
sleep 0.5

#--- Installing Volatility 2.3.1
echo -e "\e[01;35m[>]\e[00m Install Volatility Framework v2.3.1! "
sleep 2
echo -e "\e[01;35m[+]\e[00m Initialization of framework installation.... "
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/volatility/volatility-2.3.1.tar.gz
tar -zxvf volatility-2.3.1.tar.gz
cd volatility-2.3.1/
python setup.py build
sudo python setup.py build install
sleep 0.5
echo -e "\e[01;32m[+]\e[00m Installation succesful!"
sleep 0.5
echo -e "\e[01;35m[+]\e[00m Prepare for extracting vol.py!"
sleep 2
cd volatility-2.3.1/ &>/dev/null
mv vol.py ../
cd ../
sudo rm -rf distorm volatility-2.3.1.tar.gz yara-python-1.4a pycrypto-2.6.1 yara-python-1.4a.tar.gz pycrypto-2.6.1.tar.gz yara-1.4.tar.gz yara-1.4 volatility-2.3.1
echo -e "\e[01;92m[+]\e[00m Ready for use!"




