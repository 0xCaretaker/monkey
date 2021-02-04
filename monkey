#!/bin/bash
file=~/.monkey_payloads
if [ -f "$file" ]; then
type_arr+=( BASH PERL PYTHON PYTHON3 PHP RUBY NETCAT JAVA TTY POWERSHELL );
if [ "$1" = "-h" ];then
	echo -e "monkey v1.0 (c) 28-12-2020 by \e[1;36mTHEC4R3T4K3R\e[0m - Please do not use in military or secret service organizations, or for illegal purposes.";
	echo -e "Generates Reverse Shell Payloads. \e[1;36m+Bonus Python TTY!\e[0m";
	echo -e "Syntax: monkey | [TYPE] | [IP] | [PORT] | [SHELL-TYPE]\n";
	echo -e "Mandatory arguments to long options are mandatory for short options too.";
	echo -e "  -l, --list                  list all available types.";
	echo -ne "\n  Note: \e[1;36m'monkey' with even no arguments works!!\e[0m \n\t Default Type:Netcat, IP:\e[1;36mtun0\e[0m, Port:4444, Shell-type:bash.";
	echo -e "\nExamples:\n  monkey \n  monkey Bash \n  monkey Netcat 10.0.0.1 \n  monkey Python 10.0.0.1 1234\n  monkey Python 10.0.0.1 1234 zsh \n  monkey TTY";
elif [ "$1" = "-l" ] || [ "$1" = "--list" ];then
	echo -ne "Available types in monkey v1.0: \n  ";
	for type in ${type_arr[@]}
	do echo -n "$type ";
	done
	echo -e "...More coming soon!";
else
	TYPE=$1;IP=$2;PORT=$3;SHELLTYPE=$4
	TYPE=`echo ${TYPE^^}`
	if [ -z $TYPE ];then TYPE=Netcat;fi
	if [ -z $IP ];then IP=$(ifconfig tun0 | grep "inet " | cut -d" " -f10);fi
	if [ -z $PORT ];then PORT=4444;fi
	if [ -z $SHELLTYPE ];then SHELLTYPE=bash;fi

	if [[ " ${type_arr[*]} " == *"$TYPE"* ]];then
	echo -ne "\e[1;36m";cat $file  | grep $TYPE -A4 | sed "s/10.0.0.1/$IP/g" | sed "s/1234/$PORT/g" | sed "s/\/bin\/sh/\/bin\/$SHELLTYPE/g" | sed '/^[[:space:]]*$/d' 2>/dev/null;echo -ne "\e[0m"
	else
	echo -e "monkey: unrecognized option '$TYPE'\nTry 'monkey --help' for more information."
	fi
fi
else
	echo "File $file" "not found!";
	cp ./monkey_payloads ~/.monkey_payloads;
	if [ -f "$file" ];then
	echo -e "\e[1;33m  Built $file\nRun monkey again to use it!\e[0m";
	else
	echo "\e[1;31m  Unable to build $file\e[0m";
	fi
fi
