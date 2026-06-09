sudo echo ""
sudo apt update -y
sudo apt -y install wget curl make libpcre3 libpcre3-dbg libpcre3-dev build-essential autoconf automake libtool libpcap-dev libnet1-dev libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libmagic-dev libcap-ng-dev libjansson-dev pkg-config cargo libnetfilter-queue-dev libcap-ng0 libnss3-dev libgeoip-dev liblua5.1-0-dev libhiredis-dev libevent-dev libpcre2-dev python3-yaml

sudo apt install -y libnetfilter-queue-dev libnetfilter-queue1 libnetfilter-log-dev libnetfilter-log1 libnfnetlink-dev libnfnetlink0

sudo apt remove --purge rustc -y
curl -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

export SUR_VERSION=7.0.9
wget https://www.openinfosecfoundation.org/download/suricata-$SUR_VERSION.tar.gz

tar xvf suricata-$SUR_VERSION.tar.gz

pushd suricata-$SUR_VERSION/

./configure --enable-nfqueue --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-rust
make

sudo make install

sudo make install-conf

sudo ldconfig

sudo apt install python3-pip
sudo pip install --upgrade suricata-update

sudo suricata-update
popd
