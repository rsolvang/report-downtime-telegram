# Report downtime to Telegram
This is a simple bash script that uses a Telegram bot to report when one or more websites are down. Based on [sitecheck](https://github.com/rla/sitecheck) by [rla](https://github.com/rla).

## Prerequisites
- wget
- curl
- git

## Installation on a server

Add a new user that will run the script and log in
    adduser sitecheck
    su sitecheck

Fetch the script and create the required files
    git clone https://github.com/rsolvang/report-downtime-telegram.git
    touch sitelist.txt output.log

Make the script executable and make an environtment file
    chmod +x checksite.sh
    cp env-example .env
