#!/bin/bash
COUNTER=$1
COUNTER=$(( COUNTER * 60 ))

while [ $COUNTER -gt 0 ]
do
	echo "$COUNTER seconds remaining in break"
	COUNTER=$(( COUNTER - 1 ))
	sleep 1
done

echo "Break is over!"