#!/bin/bash
### Setup a wifi Access Point on Ubuntu 12.04 (or its derivatives).

### make sure that this script is executed from root
if [ $(whoami) != 'root' ]
then
    echo "
This script should be executed as root or with sudo:
    sudo $0
"
    exit 1
fi

##############################################################
## Check whether the wireless card supports Access Point mode
##############################################################

### make sure that iw is installed
apt-get -y install iw

### check that AP is supported
supports_access_point=$(iw list | sed -n -e '/* AP$/p')
if [ "$supports_access_point" = '' ]
then
    echo "AP is not supported by the driver of the wireless card."
    echo "This script does not work for this driver."
    exit 1
fi

##############################################################
##  Setup and host a network
##############################################################

### install hostapd
apt-get -y install hostapd

### it should not start automatically on boot
update-rc.d hostapd disable

### get ssid and password
ssid=$(hostname --short)
read -p "The name of your hosted network (SSID) [$ssid]: " input
ssid=${input:-$ssid}
password='1234567890'
read -p "The password of your hosted network [$password]: " input
password=${input:-$password}

### get wifi interface
rfkill unblock wifi   # enable wifi in case it is somehow disabled (thanks to Darrin Wolf for this tip)
wifi_interface=$(lshw -quiet -c network | sed -n -e '/Wireless interface/,+12 p' | sed -n -e '/logical name:/p' | cut -d: -f2 | sed -e 's/ //g')

### create /etc/hostapd/hostapd.conf
cat <<EOF > /etc/hostapd/hostapd.conf
interface=$wifi_interface
driver=nl80211
ssid=$ssid
hw_mode=g
channel=1
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=3
wpa_passphrase=$password
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
EOF

### modify /etc/default/hostapd
cp -n /etc/default/hostapd{,.bak}
sed -i /etc/default/hostapd \
    -e '/DAEMON_CONF=/c DAEMON_CONF="/etc/hostapd/hostapd.conf"'

################################################
## Set up DHCP server for IP address management
################################################

### make sure that the DHCP server is installed
apt-get -y install isc-dhcp-server

### it should not start automatically on boot
update-rc.d isc-dhcp-server disable

### set the INTERFACES on /etc/default/isc-dhcp-server
cp -n /etc/default/isc-dhcp-server{,.bak}
sed -i /etc/default/isc-dhcp-server \
    -e "/INTERFACES=/c INTERFACES=\"$wifi_interface\""

### modify /etc/dhcp/dhcpd.conf
cp -n /etc/dhcp/dhcpd.conf{,.bak}
sed -i /etc/dhcp/dhcpd.conf \
    -e 's/^option domain-name/#option domain-name/' \
    -e 's/^option domain-name-servers/#option domain-name-servers/' \
    -e 's/^default-lease-time/#default-lease-time/' \
    -e 's/^max-lease-time/#max-lease-time/'

sed -i /etc/dhcp/dhcpd.conf \
    -e '/subnet 10.10.0.0 netmask 255.255.255.0/,+4 d'
cat <<EOF >> /etc/dhcp/dhcpd.conf
subnet 10.10.0.0 netmask 255.255.255.0 {
        range 10.10.0.2 10.10.0.16;
        option domain-name-servers 8.8.4.4, 208.67.222.222;
        option routers 10.10.0.1;
}
EOF

#################################################
## Create a startup script
#################################################

cat <<EOF > /etc/init.d/wifi_access_point
#!/bin/bash

ext_interface=\$(ip route | grep default | cut -d' ' -f5)

function stop_wifi_ap {
    ### stop services dhcpd and hostapd
    service isc-dhcp-server stop
    service hostapd stop

    ### disable IP forwarding
    echo 0 > /proc/sys/net/ipv4/ip_forward
    iptables -t nat -D POSTROUTING -s 10.10.0.0/16 -o \$ext_interface -j MASQUERADE 2>/dev/null
    
    ### remove the static IP from the wifi interface
    if grep -q 'auto $wifi_interface' /etc/network/interfaces
    then
        sed -i /etc/network/interfaces -e '/auto $wifi_interface/,\$ d'
        sed -i /etc/network/interfaces -e '\$ d'
    fi

    ### restart network manager to takeover wifi management
    service network-manager restart
}

function start_wifi_ap {
    stop_wifi_ap
    sleep 3

    ### see: https://bugs.launchpad.net/ubuntu/+source/wpa/+bug/1289047/comments/8
    nmcli nm wifi off
    rfkill unblock wlan

    ### give a static IP to the wifi interface
    ip link set dev $wifi_interface up
    ip address add 10.10.0.1/24 dev $wifi_interface

    ### protect the static IP from network-manger restart
    echo >> /etc/network/interfaces
    echo 'auto $wifi_interface' >> /etc/network/interfaces
    echo 'iface $wifi_interface' inet static >> /etc/network/interfaces
    echo 'address 10.10.0.1' >> /etc/network/interfaces
    echo 'netmask 255.255.255.0' >> /etc/network/interfaces

    ### enable IP forwarding
    echo 1 > /proc/sys/net/ipv4/ip_forward
    iptables -t nat -A POSTROUTING -s 10.10.0.0/16 -o \$ext_interface -j MASQUERADE

    ### start services dhcpd and hostapd
    service hostapd start
    service isc-dhcp-server start
}

### start/stop wifi access point
case "\$1" in
    start) start_wifi_ap ;;
    stop)  stop_wifi_ap  ;;
esac
EOF

chmod +x /etc/init.d/wifi_access_point

### make sure that it is stopped on boot
sed -i /etc/rc.local \
    -e '/service wifi_access_point stop/ d'
sed -i /etc/rc.local \
    -e '/^exit/ i service wifi_access_point stop'


### display usage message
echo "
======================================

Wifi Access Point installed.

You can start and stop it with:
    service wifi_access_point start
    service wifi_access_point stop

"