# PART 1
# nmap -p 22 192.168.0.0/24 | sed ':a;N;$!ba;s/\n\n/;/g' | sed ':a;N;$!ba;s/\n/ /g' | sed 's/;/\n/g' | grep open | awk '{print $5}'
# PART 2
#(nmap --script smb-os-discovery 192.168.0.82 ;nmap --script smb-os-discovery 192.168.0.83 ; ) | grep -E 'report|NetBIOS' | sed ':a;N;$!ba;s/\n|/ /g'

#final command
(nmap -p 22 $(ifconfig $1 | grep "inet addr" | awk '{print $2}' | sed 's/addr:/ /g')/24 | sed ':a;N;$!ba;s/\n\n/;/g' | sed ':a;N;$!ba;s/\n/ /g' | sed 's/;/\n/g' | grep open | awk '{print $5}' | while read line; do nmap --script smb-os-discovery $line; done) | grep -E 'report|NetBIOS' | sed ':a;N;$!ba;s/\n|/ /g' | grep NetBIOS | awk '{print $5" "$9}'

# Dynamic ip fetch
# $(ifconfig enp2s0 | grep "inet addr" | awk '{print $2}' | sed 's/addr:/ /g')
