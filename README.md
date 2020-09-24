# monitor
This is a docker container for monitoring a server and send push notifications if state cahnges.
Notifications is send by this application [notify-cli](https://mashlol.github.io/notify/)
 
Building
-------

Build:
```
$ docker build -t crankiz/monitor .
```

Running
-------

Specify the following environment variables:
```
TOKEN=xxxxxxxxx
MONITOR_HOST=127.0.0.1
```
The token you find in your notify android app


Run:

```
$ docker run -d -e TOKEN="<NOTIFY_TOKEN>" -e MONITOR_HOST="<URL/IP>" crankiz/monitor:latest --name "monitor" /monitor.sh
```
