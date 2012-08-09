#/bin/sh
sudo mkdir -p /opt/snort2841/{bin,lib,include/linux,sbin,etc/etpro,etc/etopen,/etc/test,var/log}
sudo mkdir -p /opt/snort2861/{bin,lib,include/linux,sbin,etc/etpro,etc/etopen,/etc/test,var/log}
sudo mkdir -p /opt/snort2904/{bin,lib,include/linux,sbin,etc/etpro,etc/etopen,/etc/test,var/log}
sudo mkdir -p /opt/snort2905/{bin,lib,include/linux,sbin,etc/etpro,etc/etopen,/etc/test,var/log}
sudo mkdir -p /opt/snort2922/{bin,lib,include/linux,sbin,etc/etpro,etc/etopen,/etc/test,var/log}
sudo mkdir -p /opt/snort2923/{bin,lib,include/linux,sbin,etc/etpro,etc/etopen,/etc/test,var/log}
sudo mkdir -p /opt/snort293/{bin,lib,include/linux,sbin,etc/etpro,etc/etopen,/etc/test,var/log}
sudo mkdir -p /opt/suricata121/{bin,lib,include/linux,sbin,etc/etpro,etc/etopen,/etc/test,var/log}
sudo mkdir -p /opt/suricata13/{bin,lib,include/linux,sbin,etc/etpro,etc/etopen,/etc/test,var/log}
sudo mkdir -p /opt/suricata13JIT/{bin,lib,include/linux,sbin,etc/etpro,etc/etopen,/etc/test,var/log}

NUM_CORES=`grep processor /proc/cpuinfo | sort -u | wc -l`

yum -y install epel-release 

sudo yum -y install libpcap libpcap-devel libnet libnet-devel pcre pcre-devel gcc gcc-c++ automake autoconf libtool make libyaml libyaml-devel zlib zlib-devel python-devel scapy python-yaml bison flex mysql-client mysql-server libdnet libcapng libcapng-devel MySQL-python PyYAML nss-devel nspr-devel perl-libwww-perl perl-Crypt-SSLeay perl-libwww-perl perl-Archive-Tar file-devel

tar -xzvf snort_2.8.4.1.orig.tar.gz
cd snort-2.8.4.1
./configure --enable-perfprofiling --prefix=/opt/snort2841/ && make  && sudo make install
sudo cp etc/* /opt/snort2841/etc/
cd ..

tar -xzvf snort-2.8.6.1.tar.gz
cd snort-2.8.6.1
./configure --enable-perfprofiling --prefix=/opt/snort2861/ && make  && sudo make install
sudo cp etc/* /opt/snort2861/etc/
cd ..

tar -xzvf pcre-8.30.tar.gz
cd pcre-8.30
./configure --prefix=/opt/pcre-8.30/ --enable-jit --enable-utf8 --enable-unicode-properties
make  && sudo make install
cd ..

tar -xzvf suricata-1.2.1.tar.gz
cd suricata-1.2.1
./configure --enable-profiling --prefix=/opt/suricata121/ --with-libnss-includes=/usr/include/nss3 --with-libnss-libs=/usr/lib/nss3 --with-libnspr-includes=/usr/include/nspr4 --with-libnspr-libraries=/usr/lib/nspr4 && make  && sudo make install
sudo cp suricata.yaml /opt/suricata121/etc/
sudo cp reference.config /opt/suricata121/etc/
sudo cp classification.config /opt/suricata121/etc/
cd ..

tar -xzvf suricata-1.3.tar.gz
cd suricata-1.3
./configure --enable-profiling --prefix=/opt/suricata13/ --with-libnss-includes=/usr/include/nss3 --with-libnss-libs=/usr/lib/nss3 --with-libnspr-includes=/usr/include/nspr4 --with-libnspr-libraries=/usr/lib/nspr4 && make  && sudo make install
sudo cp suricata.yaml /opt/suricata13/etc/
sudo cp reference.config /opt/suricata13/etc/
sudo cp classification.config /opt/suricata13/etc/
make distclean
./configure LD_RUN_PATH="/opt/pcre-8.30/lib:/usr/lib:/usr/local/lib" --enable-pcre-jit --with-libpcre-libraries=/opt/pcre-8.30/lib/ --with-libpcre-includes=/opt/pcre-8.30/include/ --enable-profiling --prefix=/opt/suricata13JIT/ --with-libnss-includes=/usr/include/nss3 --with-libnss-libs=/usr/lib/nss3 --with-libnspr-includes=/usr/include/nspr4 --with-libnspr-libraries=/usr/lib/nspr4 && make && sudo make install
sudo cp suricata.yaml /opt/suricata13JIT/etc/
sudo cp reference.config /opt/suricata13JIT/etc/
sudo cp classification.config /opt/suricata13JIT/etc/
cd ..

tar -xzvf libdnet-1.11.tar.gz
cd libdnet-1.11
./configure --prefix=/opt/libdnet111/
make  && sudo make install
cd ..



tar -xzvf daq-0.5.tar.gz
cd daq-0.5
./configure --prefix=/opt/snort2904/ && make  && sudo make install
make clean
./configure --prefix=/opt/snort2905/ && make  && sudo make install
cd ..

tar -xzvf snort-2.9.0.4.tar.gz
cd snort-2.9.0.4
PATH="/opt/snort2904/bin:$PATH" ./configure  --enable-ipv6 --enable-gre --enable-mpls --with-dnet-includes=/opt/libdnet111/include/ --with-dnet-libraries=/opt/libdnet111/lib/ --enable-targetbased --enable-decoder-preprocessor-rules --enable-ppm --enable-perfprofiling --enable-zlib LD_RUN_PATH="/opt/snort2904/lib:/opt/libdnet111/lib:/usr/lib:/usr/local/lib" --prefix=/opt/snort2904/ --with-daq-includes=/opt/snort2904/include/ --with-daq-libraries=/opt/snort2904/lib/ && make  && sudo make install
sudo cp etc/* /opt/snort2904/etc/
cd ..

tar -xzvf snort-2.9.0.5.tar.gz
cd snort-2.9.0.5
PATH="/opt/snort2905/bin:$PATH" ./configure  --enable-ipv6 --enable-gre --enable-mpls --with-dnet-includes=/opt/libdnet111/include/ --with-dnet-libraries=/opt/libdnet111/lib/ --enable-targetbased --enable-decoder-preprocessor-rules --enable-ppm --enable-perfprofiling --enable-zlib LD_RUN_PATH="/opt/snort2905/lib:/opt/libdnet111/lib:/usr/lib:/usr/local/lib" --prefix=/opt/snort2905/ --with-daq-includes=/opt/snort2905/include/ --with-daq-libraries=/opt/snort2905/lib/ && make  && sudo make install
sudo cp etc/* /opt/snort2905/etc/
cd ..

tar -xzvf daq-0.6.2.tar.gz
cd daq-0.6.2
./configure --prefix=/opt/snort2922/ && make  && sudo make install
./configure --prefix=/opt/snort2923/ && make  && sudo make install
cd ..

tar -xzvf snort-2.9.2.2.tar.gz
cd snort-2.9.2.2
PATH="/opt/snort2922/bin:$PATH" ./configure --enable-ipv6 --enable-gre --enable-mpls --with-dnet-includes=/opt/libdnet111/include/ --with-dnet-libraries=/opt/libdnet111/lib/ --enable-targetbased --enable-decoder-preprocessor-rules --enable-ppm --enable-perfprofiling --enable-zlib --enable-active-response --enable-normalizer --enable-reload --enable-react --enable-flexresp3 LD_RUN_PATH="/opt/snort2922/lib:/opt/libdnet111/lib:/usr/lib:/usr/local/lib" --prefix=/opt/snort2922/ --with-daq-includes=/opt/snort2922/include/ --with-daq-libraries=/opt/snort2922/lib/ && make  && sudo make install
sudo cp etc/* /opt/snort2922/etc/
cd ..

tar -xzvf snort-2.9.2.3.tar.gz
cd snort-2.9.2.3
PATH="/opt/snort2923/bin:$PATH" ./configure --enable-ipv6 --enable-gre --enable-mpls --with-dnet-includes=/opt/libdnet111/include/ --with-dnet-libraries=/opt/libdnet111/lib/ --enable-targetbased --enable-decoder-preprocessor-rules --enable-ppm --enable-perfprofiling --enable-zlib --enable-active-response --enable-normalizer --enable-reload --enable-react --enable-flexresp3 LD_RUN_PATH="/opt/snort2923/lib:/opt/libdnet111/lib:/usr/lib:/usr/local/lib" --prefix=/opt/snort2923/ --with-daq-includes=/opt/snort2923/include/ --with-daq-libraries=/opt/snort2923/lib/ && make  && sudo make install
sudo cp etc/* /opt/snort2923/etc/
cd ..

tar -xzvf daq-1.1.1.tar.gz
cd daq-1.1.1
./configure --prefix=/opt/snort293/ && make  && sudo make install
cd ..

tar -xzvf snort-2.9.3.tar.gz
cd snort-2.9.3
PATH="/opt/snort293/bin:$PATH" ./configure --enable-ipv6 --enable-gre --enable-mpls --with-dnet-includes=/opt/libdnet111/include/ --with-dnet-libraries=/opt/libdnet111/lib/ --enable-targetbased --enable-decoder-preprocessor-rules --enable-ppm --enable-perfprofiling --enable-zlib --enable-active-response --enable-normalizer --enable-reload --enable-react --enable-flexresp3 LD_RUN_PATH="/opt/snort293/lib:/opt/libdnet111/lib:/usr/lib:/usr/local/lib" --prefix=/opt/snort293/ --with-daq-includes=/opt/snort293/include/ --with-daq-libraries=/opt/snort293/lib/ && make  && sudo make install
sudo cp etc/* /opt/snort293/etc/
cd ..

sudo python ./gunstar-maker.py
tar -xzvf pulledpork-0.6.1.tar.gz
cd pulledpork-0.6.1
patch -p1 < ../ppconfigs/pulledpork-etpro-fix.diff
sudo cp -f pulledpork.pl /usr/local/bin/
cd ..
sudo cp ruleupdates.sh /usr/local/bin/

CURRENT_USER=`whoami`
sudo chown $CURRENT_USER /opt/snort* -Rf
sudo chown $CURRENT_USER /opt/suricata* -Rf

rm daq-0.6.2 -Rf
rm daq-0.5 -Rf
rm daq-1.1.1 -Rf
rm snort-2.8.4.1 -Rf
rm snort-2.8.6.1 -Rf
rm snort-2.9.0.4 -Rf
rm snort-2.9.0.5 -Rf 
rm snort-2.9.2.2 -Rf
rm snort-2.9.2.3 -Rf
rm snort-2.9.3 -Rf
rm pcre-8.30 -Rf
rm suricata-1.2.1 -Rf 
rm suricata-1.3 -Rf
rm pulledpork-0.6.1 -Rf
rm libdnet-1.11 -Rf