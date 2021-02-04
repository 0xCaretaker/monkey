# monkey
Quick and simple reverse shell payload generator to save time. <br/>
Available types in monkey v2.0:
  Bash, Perl, Python, Python3, PHP, Ruby, Netcat, Java,Python TTY and Powershell.
<br/>
<b>Installation:</b><br />
  1. ```git clone https://github.com/THEC4R3T4K3R/monkey.git```<br />
  2. ```cd monkey; chmod +x monkey```<br />
  3. ```./monkey```<br /><br />
  Now Monkey is globally installed! You can simply use it from anywhere with ```monkey```.  <br />
<b>Usage: </b>
  ```monkey```, ```monkey -h``` or ```monkey --help``` for more instructions.
  <br />
  
    Generates Reverse Shell Payloads + Python TTY!
    Syntax: monkey | [TYPE] | [IP] | [PORT] | [SHELL-TYPE]
    
    Mandatory arguments to long options are mandatory for short options too.
      -l, --list                  list all available types.
          --purge                 remove monkey.
    
      Note: 'monkey' with even no arguments works!!
             Default Type:Netcat, IP:tun0, Port:4444, Shell-type:bash.
    Examples:
      monkey
      monkey bash
      monkey power 10.0.0.1 1234 
      monkey Netcat 10.0.0.1
      monkey PYTHON 10.0.0.1 1234
      monkey TTY
