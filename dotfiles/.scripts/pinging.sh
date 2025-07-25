#!/bin/bash

PING_NUM=4

# this is in ms
TOTAL_TIME=0

mullvad relay update

mapfile -t mv_ips < <( mullvad relay list | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" )
NUMSERVERS=${#mv_ips[@]}

# mapfile -t TESTS < <( mullvad relay list | grep -i "al-" | grep -v "us-" | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" )

i=0
for IP in "${mv_ips[@]}"
do
	score=$(ping -q -c $PING_NUM $IP | grep -E -o "[0-9]{4}ms" | grep -E -o "[0-9]{4}")
	mv_ips[$i]="${score} --- ${IP}"
	((i++));
	echo "Checked:" $IP", score of:" $score", total searched:" $i "of" $NUMSERVERS
	TOTAL_TIME=$((TOTAL_TIME + score))
done

readarray -t SORTED_IPS_BY_SPEED < <( for a in "${mv_ips[@]}"; do echo "$a"; done | sort -n)
recommended_server_ip=$(echo $SORTED_IPS_BY_SPEED | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" )
recommended_connection=$(mullvad relay list | grep -i $recommended_server_ip)

# echo $SORTED_IPS_BY_SPEED
# echo $recommended_server_ip
# echo $recommended_connection
# echo $TOTAL_TIME

printf "Recommend connecting to:
$recommended_connection
NOTE! time taken: $TOTAL_TIME ms, may no longer be the fastest\n"
