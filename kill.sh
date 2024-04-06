read -p "請輸入錢包代號" SESSION_NAME
screen -ls "$SESSION_NAME" | (
  IFS=$(printf '\t');
  sed "s/^$IFS//" |
  while read -r name stuff; do
      screen -S "$name" -X quit
  done
)
