# monkey
Quick and simple reverse shell payload generator to save time.

<b>Installation:</b><br />
  1. ```git clone https://github.com/THEC4R3T4K3R/monkey.git```<br />
  2. ```cd monkey; chmod +x monkey```<br />
  3. ```./monkey```<br /><br />
  Now Monkey is globally installed! You can simply use it from anywhere with ```monkey```.  <br />
<b>Usage: </b>
  ```monkey```, ```monkey -h``` or ```monkey --help``` for more instructions.
  <br />
  <br />
  <br />
```monkey v2.0 (c) 28-12-2020 by THEC4R3T4K3R - Please do not use in military or secret service organizations, or for illegal purposes.<br />
Generates Reverse Shell Payloads + Python TTY!<br />
Syntax: monkey | [TYPE] | [IP] | [PORT] | [SHELL-TYPE]<br />
<br />
Mandatory arguments to long options are mandatory for short options too.<br />
  -l, --list                  list all available types.<br />
      --purge                 remove monkey.<br />
<br />
  Note: 'monkey' with even no arguments works!!<br />
         Default Type:Netcat, IP:tun0, Port:4444, Shell-type:bash.<br />
Examples:<br />
  monkey<br />
  monkey Bash<br />
  monkey Netcat 10.0.0.1<br />
  monkey Python 10.0.0.1 1234<br />
  monkey Python 10.0.0.1 1234 zsh<br />
  monkey TTY<br />
```
