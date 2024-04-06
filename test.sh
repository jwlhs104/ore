#!/bin/bash
input="rpc.txt"
######################################
# $IFS removed to allow the trimming # 
#####################################
read -p "請輸入錢包代號" custom_wallet
while read -r RPC_URL
do
  echo "ore --rpc $RPC_URL --keypair ~/.config/solana/ore1.json --priority-fee 150000 mine --threads 8"
  start="while true; do ore --rpc $RPC_URL --keypair ~/.config/solana/ore1.json --priority-fee 150000 mine --threads 8; echo '进程异常退出，等待重启' >&2; sleep 1; done"
  screen -dmS "$custom_wallet" bash -c "$start"
done < "$input"
