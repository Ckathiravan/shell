#!/bin/sh
> /tmp/uptime-report.out
username=vagrant
echo " -------------- -------------- --------------- -------- " >> /tmp/uptime-report.out
echo " HOSTNAME          Kernal          arch                        OS" >> /tmp/uptime-report.out
echo "--------------- -------------- --------------- -------- " >> /tmp/uptime-report.out
for host in `cat /home/vagrant/shell_test/servers.txt`
do
#echo -n "$host: "
#ssh $host  echo "`uname -a | awk '{print $2 "\t\t\t"  $3 "\t\t\t " $13}'`  `cat /etc/*release* | grep -i des | awk -F '"' '{print $2}'`"
#done | column -t >> /tmp/uptime-report.out
output=`ssh -l $username $host uname -a | awk '{print $2 "\t\t\t"  $3 "\t\t\t " $13}';cat /etc/*release* | grep -i des | awk -F '"' '{print $2}'`
echo $output >> /tmp/uptime-report.out
done


cat /tmp/uptime-report.out | column -t
