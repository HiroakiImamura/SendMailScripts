#!/bin/bash

#Sendgrid用API Key
KEY=$1

mail_type=$2

# 送信元メールアドレス
#FROM="GCP_Admin04@sjnk.co.jp"
FROM="noreply@oshiete.sompo"
# メール本文
VAL="<html><head></head><body><b>ウォームアップメール${mail_type}</b><br><a href="https://www.google.com/">Link確認用(Google)</a><br><br>※当メールは送信テストのため返信しないで下さい。</body></html>"


count=0

# 送信先リストファイルを読み込み、1行ずつメールを送信
while read line
do

  # 送信件数ログ出力
  count=`expr $count + 1`
  echo "送信件数：${count}"
  echo "------------------"

  #yymmdd=`date '+%Y%m%d%H%M%S'`
  yymmdd=`date '+%Y%m%d'`
  subject="${yymmdd}_SendGridウォームアップメール${mail_type}"
  to=$line

  # 送信
  sh send.sh $KEY $to $FROM $subject "$VAL"

  # 次送信までのまち
  sleep 0.1

done < ./send_list.txt
