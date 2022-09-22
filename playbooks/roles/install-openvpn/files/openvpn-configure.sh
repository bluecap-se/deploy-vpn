#!/usr/bin/expect -f

set timeout -1

spawn bash /tmp/openvpn-install.sh

expect "IPv4 address"
send -- "\r"

expect "Protocol"
send -- "\r"

expect "Port"
send -- "\r"

expect "DNS"
send -- "\r"

expect "client"
send -- "\r"

expect "Press any key to continue..."
send -- "\r"

expect eof
