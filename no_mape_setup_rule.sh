# https://zenn.dev/wistnki
#!/bin/sh
IPv4_IPv4
TUNDEV_TUNDEV
PSID_PSID
PREFIX=1024
BLOCKS=63

nft table ip mape_nat
nft delete table ip mape_nat

nft add table ip mape_nat
nft add chain ip mape_nat POSTROUTING { type nat hook postrouting priority 100 \; }
nft add rule mape_nat POSTROUTING oifname $TUNDEV meta l4proto { tcp, udp, icmp } mark set numgen inc mod $BLOCKS offset 0x11 counter

for r in `seq 1 $BLOCKS ` ; do
    mark=$(( r + 0x10 ))
    port_l=$(( r * PREFIX + PSID * 16 ))
    port_r=$((port_l + 15))

    nft add rule ip mape_nat POSTROUTING oifname $TUNDEV meta l4proto { tcp, udp, icmp } counter mark $mark snat to $IPv4:$port_l-$port_r persistent
done

