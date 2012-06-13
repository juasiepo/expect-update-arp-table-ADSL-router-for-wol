#!/usr/bin/expect -f
set timeout 10
set env(TERM)

set router "router"  #your router's dns name or IP
set login "admin"    #your router's login. admin is the default
set password "admin" #your router's password. admin is the default
set ip "192.168.1.2" #your server's IP address (not the dns name)
set mac "2f:1e:8a:84:2a:f9" #your server's MAC 

spawn telnet $router
expect "Login: "
send -- "$login\r"
expect "Password: "
send -- "$password\r"
expect "ATP>"
send "sh\r"
expect "# "
send "arp -s $ip $mac\r"
expect "# "
## check that all is right
send "arp -a\r"
expect "# "
