FROM  alpine:3.8
# Install nodejs
RUN apk add --no-cache --update nodejs npm
RUN npm install -g notify-cli

ADD bin/monitor.sh /monitor.sh
RUN chmod 700 /monitor.sh
