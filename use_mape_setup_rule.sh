#!/bin/sh
# this script based  https://zenn.dev/wistnki
# use map version
IPv4_IPv4
TUNDEV_TUNDEV
PSID_PSID
PREFIX_PREFIX
BLOCKS_BLOCKS

nft table ip mape_nat
nft delete table ip mape_nat

nft add table ip mape_nat
nft add map ip mape_nat chain_map { type mark : verdict \; }
nft add chain ip mape_nat POSTROUTING { type nat hook postrouting priority 100 \; }
nft add rule mape_nat POSTROUTING oifname map-$TUNDEV meta l4proto { tcp, udp, icmp } mark set numgen inc mod $BLOCKS offset 0x11 counter
nft add rule mape_nat POSTROUTING oifname map-$TUNDEV meta mark vmap @chain_map;

for r in `seq 1 $BLOCKS ` ; do
    mark=$(( r + 0x10 ))
    port_l=$(( r * PREFIX + PSID * 16 ))
    port_r=$((port_l + 15))

    nft add chain ip mape_nat mape_ports$r
    nft add rule ip mape_nat mape_ports$r meta l4proto { tcp, udp, icmp } counter snat to $IPv4:$port_l-$port_r persistent
    nft add element ip mape_nat chain_map { $mark : goto mape_ports$r }
done
