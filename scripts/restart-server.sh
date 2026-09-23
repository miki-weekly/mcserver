#!/bin/bash

cd ~/mcserver/mcserver || exit 1


CONTAINER="mcserver-minecraft-1"

# Warn players at intervals
docker exec "$CONTAINER" rcon-cli say "Server restarting in 5 minutes; Expected downtime 5 minutes."
sleep 240

docker exec "$CONTAINER" rcon-cli say "Server restarting in 1 minute; Expected downtime 5 minutes."
sleep 30

docker exec "$CONTAINER" rcon-cli say "Server restarting in 30 seconds; Expected downtime 5 minutes."
sleep 20

docker exec "$CONTAINER" rcon-cli say "Restarting now; Expected downtime 5 minutes."
sleep 10

# Save the world before restart, just in case
docker exec "$CONTAINER" rcon-cli save-all

sleep 5

# Restart the container
docker compose restart minecraft

echo "$(date): server restarted" >> ~/mcserver/mcserver/logs/restart.log
