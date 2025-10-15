echo ..:: Server is Starting ::..
cd /home/azureuser/css
rm cstrike/DownloadLists/*
rm cstrike/logs/*
rm cstrike/console.log
screen -S css -X -p0 stuff 'exit'`echo -ne '\015'`
sleep 1
kill -9 $(ps ax | grep "port 27015" | grep -v grep | awk '{print $1}')
kill -9 $(ps ax | grep css | grep -v grep | awk '{print $1}')
screen -wipe
sleep 2
taskset -c 0 screen -A -m -d -S css ./srcds_run -console -game cstrike -nomaster -tvdisable -localcser -tickrate 66 +fps_max 0 +maxplayers 24 +map de_dust2 +sv_lan 0 -port 27015 -condebug -secure
echo ..:: Server is Running ::..
sleep 1
screen -r css
echo "========================"
echo "Simulated CSS Server Start"
echo "========================"
# simulate server start; replace with real srcds_run later
echo "Listening on UDP port 27015"
# keep container alive for demo
tail -f /dev/null
