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
  read -p "Restart. Please key."
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
  read -p "Restart. Please key."
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
  read -p "Restart. Please key."
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
  read -p "Restart. Please key."
  reboot
}

# OCN Virtual Connect
function _func5
while :
do
  echo "------------------------------------------------------"
  echo -e "\033[0;34m[1]: \033[0;39m"Version use MAP.
  echo -e "\033[0;34m[2]: \033[0;39m"Version without MAP.
  echo -e "\033[0;31m[r]: \033[0;39m"GO BACK.
  echo "------------------------------------------------------"
  read -p "Please select a number.: " num
  case "${num}" in
    "1" ) _func1 ;;
    "2" ) _func2 ;;
    "r" ) break ;;
  esac
done

# V6 Plus / IPv6 Option
function _func6
while :
do
  echo "------------------------------------------------------"
  echo -e "\033[0;34m[1]: \033[0;39m"Version use MAP.
  echo -e "\033[0;34m[2]: \033[0;39m"Version without MAP.
  echo -e "\033[0;31m[r]: \033[0;39m"GO BACK.
  echo "------------------------------------------------------"
  read -p "Please select a number.: " num
  case "${num}" in
    "1" ) _func3 ;;
    "2" ) _func4 ;;
    "r" ) break ;;
  esac
done

# main
while :
do
  echo "------------------------------------------------------"
  echo -e "\033[0;34m[1]: \033[0;39m"OCN Virtual Connect.
  echo -e "\033[0;34m[2]: \033[0;39m"V6 Plus / IPv6 Option.
  echo -e "\033[0;31m[q]: \033[0;39m"EXIT.
  echo "------------------------------------------------------"
  read -p "Please select a number.: " num
  case "${num}" in
    "1" ) _func5 ;;
    "2" ) _func6 ;;
    "q" ) exit 0 ;;
  esac
done
