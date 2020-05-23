#!/bin/bash

number_of_mails=$1
mail_type=$2
api_key=""

if [[ $mail_type = 'A' ]]; then
	#新700K用
	echo "${mail_type}"
	api_key=""
elif [[ $mail_type = 'B' ]]; then
	#旧700K用
	echo "${mail_type}"
	api_key=""
else
	exit 1
fi


i=0
while [ $i -lt $number_of_mails ]
do
	./send-warmup-mail.sh $api_key $mail_type
	i=$((i + 1))
done
