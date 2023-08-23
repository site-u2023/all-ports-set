#! /bin/bash
# OCN Virtual Connect version use MAP
function _func1
{
  # mape setup rule
  wget --no-check-certificate -O /etc/mape_setup_rule.sh https://raw.githubusercontent.com/site-u2023/all-ports-set/main/use_mape_setup_rule.sh
  chmod +x /etc/mape_setup_rule.sh
  # ocn config
  sed -i -e "s/PREFIX_PREFIX/PREFIX=1024/g" /etc/mape_setup_rule.sh
  sed -i -e "s/BLOCKS_BLOCKS/BLOCKS=63/g" /etc/mape_setup_rule.sh
  # script run
  bash /etc/all_ports_set.sh
  read -p "Press key to reboot."
  reboot
}
# OCN Virtual Connect Version without MAP
function _func2
{
  # mape setup rule
  wget --no-check-certificate -O /etc/mape_setup_rule.sh https://raw.githubusercontent.com/site-u2023/all-ports-set/main/dont_mape_setup_rule.sh
  chmod +x /etc/mape_setup_rule.sh
  # ocn config
  sed -i -e "s/PREFIX_PREFIX/PREFIX=1024/g" /etc/mape_setup_rule.sh
  sed -i -e "s/BLOCKS_BLOCKS/BLOCKS=63/g" /etc/mape_setup_rule.sh
  # script run
  bash /etc/all_ports_set.sh
  read -p "Press key to reboot."
  reboot
}
# V6 Plus / IPv6 Option version use MAP 
function _func3
{
  # mape setup rule
  wget --no-check-certificate -O /etc/mape_setup_rule.sh https://raw.githubusercontent.com/site-u2023/all-ports-set/main/use_mape_setup_rule.sh
  chmod +x /etc/mape_setup_rule.sh
  # v6plus & ipv6option config
  sed -i -e "s/PREFIX_PREFIX/PREFIX=4096/g" /etc/mape_setup_rule.sh
  sed -i -e "s/BLOCKS_BLOCKS/BLOCKS=15/g" /etc/mape_setup_rule.sh
  # script run
  bash /etc/all_ports_set.sh
  read -p "Press key to reboot."
  reboot
}
# V6 Plus / IPv6 Option Version without MAP 
function _func4
{
  # mape setup rule
  wget --no-check-certificate -O /etc/mape_setup_rule.sh https://raw.githubusercontent.com/site-u2023/all-ports-set/main/dont_mape_setup_rule.sh
  chmod +x /etc/mape_setup_rule.sh
  # v6plus & ipv6option config
  sed -i -e "s/PREFIX_PREFIX/PREFIX=4096/g" /etc/mape_setup_rule.sh
  sed -i -e "s/BLOCKS_BLOCKS/BLOCKS=15/g" /etc/mape_setup_rule.sh
  # script run
  bash /etc/all_ports_set.sh
  read -p "Press key to reboot."
  reboot
}
# OCN Virtual Connect
function _func_OCN
while :
do
  echo -e "\033[1;32m OCN Virtual Connect. ------------------------------------------\033[0;39m"
  echo -e "\033[1;32m[u]: \033[0;39m"Version use MAP.
  echo -e "\033[1;34m[w]: \033[0;39m"Version without MAP.
  echo -e "\033[1;31m[r]: \033[0;39m"Go Back.
  echo -e "\033[1;32m ---------------------------------------------------------------\033[0;39m"
  read -p " Please select a key.: " num
  case "${num}" in
    "u" ) _func1 ;;
    "w" ) _func2 ;;
    "r" ) break ;;
  esac
done
# V6 Plus / IPv6 Option
function _func_V6
while :
do
  echo -e "\033[1;34m V6 Plus / IPv6 Option.-----------------------------------------\033[0;39m"
  echo -e "\033[1;32m[u]: \033[0;39m"Version use MAP.
  echo -e "\033[1;34m[w]: \033[0;39m"Version without MAP.
  echo -e "\033[1;31m[r]: \033[0;39m"Go Back.
  echo -e "\033[1;34m ---------------------------------------------------------------\033[0;39m"
  read -p " Please select a key.: " num
  case "${num}" in
    "u" ) _func3 ;;
    "w" ) _func4 ;;
    "r" ) break ;;
  esac
done
# main
while :
do
  echo -e "\033[1;33m Script installation Version. ----------------------------------\033[0;39m"
  echo -e "\033[1;32m[o]: \033[0;39m"OCN Virtual Connect.
  echo -e "\033[1;34m[v]: \033[0;39m"V6 Plus / IPv6 Option.
  echo -e "\033[1;31m[q]: \033[0;39m"Exit.
  echo -e "\033[1;33m ---------------------------------------------------------------\033[0;39m"
  read -p " Please select a key.: " num
  case "${num}" in
    "o" ) _func_OCN ;;
    "v" ) _func_V6 ;;
    "q" ) exit 0 ;;
  esac
done
