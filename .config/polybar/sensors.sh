#free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
#df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
#top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}' 

cpu=`awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' \
<(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat)`

cpuTemp=`echo $(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))`

memTotal=`free | grep "Mem" | awk '{print $2}'`
memUsed=`free | grep "Mem" | awk '{print $3}'`
memP=$((100*$memUsed/$memTotal))

echo $cpu
echo $cpuTemp
echo $memTotal
echo $memUsed
echo $memP