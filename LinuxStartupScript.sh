#!/bin/bash
# For Debian and Ubuntu vultr StartupScript

# YOUR_WEBHOOK_TOKEN
# https://open.feishu.cn/open-apis/bot/v2/hook/
YOUR_WEBHOOK_TOKEN = "https://open.feishu.cn/open-apis/bot/v2/hook/xxxxxxxxxxxxx"
# disable firewall
ufw disable

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# install docker compose 
apt-get update
apt-get install docker-compose-plugin

# install xray docker
EXTERNAL_PORT=2333 && docker run -d --name xray_reality --restart=always --log-opt max-size=100m --log-opt max-file=3 -p $EXTERNAL_PORT:443 -e EXTERNAL_PORT=$EXTERNAL_PORT wulabing/xray_docker_reality:latest && sleep 3 && docker exec -it xray_reality cat /config_info.txt

curl -s -X POST "$YOUR_WEBHOOK_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"msg_type":"text","content":{"text":"Xray Reality VLESS link:\n"}}'
  
docker logs xray_reality 2>&1 \
| grep -o 'vless://[^ ]*-wulabing_docker_vless_reality_vision' \
| head -n 1 \
| xargs -I {} curl -s -X POST "$YOUR_WEBHOOK_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"msg_type":"text","content":{"text":"{}"}}'
  
