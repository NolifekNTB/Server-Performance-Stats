#/usr/bin/bash
echo "Total CPU usage:"
top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
 	   awk '{printf "used: %.2f%%\n", 100 - $1}'

echo

echo "Total memory usage:"
free | grep Mem | awk '{ printf("free: %.4f %\n", $4/$2 * 100.0) }'
free | grep Mem | awk '{ printf("used: %.4f %\n", $3/$2 * 100.0) }'

echo "Total disk usage:"
df -h|awk '{s+=$3}{a+=$4} END {printf ("%.4f %\n", $3/($3+$4) * 100)}'

echo "Top 5 processes by CPU usage:"
ps -eo pcpu,pid,user,args --sort=-pcpu |head -n 6

echo "Top 5 processes by memory usage:"
ps aux --sort=-pmem |head -n 5
