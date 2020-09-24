# monitor
 This is a docker container for monitoring a server and send push notifications if state cahnges.
 
Building
-------

Build:
```
$ docker build -t crankiz/monitor .
```

Running
-------

Run:

```
$ docker run -d -e TOKEN="<NOTIFY_TOKEN>" -e MONITOR_HOST="<URL/IP>" crankiz/monitor:latest --name "monitor" /monitor.sh
```
