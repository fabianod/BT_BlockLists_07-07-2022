#! /bin/bash
wget -i url.txt -O - | sed "/^#.*/d" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sort --unique > /tmp/list_1.txt

while read line; do 
echo "blocklist:$line-$line"; 
done < /tmp/list_1.txt > combined_1.txt

gzip -c combined_1.txt > bt_blocklists.gz
