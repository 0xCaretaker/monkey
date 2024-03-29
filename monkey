#!/bin/bash
file=~/.monkey_payloads
if ! [ -f "$file" ];then
cp ./monkey_payloads ~/.monkey_payloads;
cp ./monkey /usr/bin/monkey
echo hello;
fi

type_arr+=( NC BASH PERL PYTHON PYTHON3 PHP RUBY NETCAT JAVA TTY POWERSHELL DOWNLOAD);
if [ "$1" = "-h" ] || [ "$1" = "--help" ];then
        echo -e "monkey v2.0 (c) 28-12-2020 by \e[1;36mTHEC4R3T4K3R\e[0m - Please do not use in military or secret service organizations, or for illegal purposes.";
        echo -e "Generates Reverse Shell Payloads + Python TTY!";
        echo -e "Syntax: monkey | [TYPE] | [IP] | [PORT] | [SHELL-TYPE]\n";
        echo -e "Mandatory arguments to long options are mandatory for short options too.";
        echo -e "  -l, --list                  list all available types.";
        echo -e "      --purge                 remove monkey.";
        echo -ne "\n  Note: \e[1;36m'monkey' with even no arguments works!!\e[0m \n\t Default Type:Netcat, IP:\e[1;36mtun0\e[0m, Port:4444, Shell-type:bash.";
        echo -e "\nExamples:\n  monkey \n  monkey bash \n  monkey power 10.0.0.1 \n  monkey Netcat 10.0.0.1 1234\n  monkey PYTHON 10.0.0.1 1234 zsh \n  monkey TTY";
elif [ "$1" = "-l" ] || [ "$1" = "--list" ];then
        echo -ne "Available types in monkey v1.0: \n  ";
        for type in ${type_arr[@]}
        do echo -n "$type ";
        done
        echo -e "...More coming soon!";
elif [ "$1" = "--purge" ];then
        rm ~/.monkey_payloads /usr/bin/monkey
        echo "Removed Monkey.";
else
        TYPE=$1;IP=$2;PORT=$3;SHELLTYPE=$4
        TYPE=`echo ${TYPE^^}`
        if [ -z $TYPE ];then TYPE=NC;fi
        if [ -z $IP ];then IP=$(ifconfig tun0 | grep "inet " | cut -d" " -f10);fi
        if [ -z $PORT ];then PORT=443;fi
        if [ -z $SHELLTYPE ];then SHELLTYPE=bash;fi

        if [[ " ${type_arr[*]} " == *"$TYPE"* ]];then
        cat $file  | grep $TYPE -A4 | sed "s/10.0.0.1/$IP/g" | sed "s/1234/$PORT/g" | sed "s/\/bin\/sh/\/bin\/$SHELLTYPE/g" | sed '/^[[:space:]]*$/d' | grep -v $TYPE 2>/dev/null;
        else
        echo -e "monkey: unrecognized option '$TYPE'\nTry 'monkey --help' for more information."
        fi
fi
