# Report downtime of one or more websites to Telegram
This simple bash script uses a Telegram bot to report when one or more websites are down. Inspired by [sitecheck](https://github.com/rla/sitecheck) by [rla](https://github.com/rla).

## Prerequisites
- wget
- curl
- git

## Installation

Add a new user that will run the script and switch to the new user

    adduser sitecheck
    su sitecheck

Fetch the script and create the required files

    git clone https://github.com/rsolvang/report-downtime-telegram.git
    touch sitelist.txt output.log

Make the script executable and make an environtment file

    chmod +x checksite.sh
    cp env-example .env

Fill in the correct information in the .env file. Follow the instructions below to create a Telegram bot if you do not already have one.

## How to make a Telegram bot

Note: The following steps assumes you already have a Telegram account.

1. Search for @BotFather in your preferred Telegram client. 
2. Create a new bot by typing `/newbot` and give it a common name (Your Bot Name) and a username (yourbotname_bot). Note that the username *has* to end with "bot" to be valid!
3. Copy your token to a safe place, prefferably a password manager. This token is your authentication to send requests to the Telegram API.

### Retrive your Chat ID

You need to tell your bot which user to send messages to. To find your own Chat ID, you need to start a conversation with your newly created bot and send a request through the API:

1. Find your bot in Telegram by searching for it (e.g. @yourbotname_bot)
2. Send your bot a simple message, the content does not matter.
3. Ask your bot for the information on the current conversation by sending the following API request:
  - In a browser: `https://api.telegram.org/bot<INSERT YOUR TOKEN HERE>/getUpdates`
  - On a terminal: `curl https://api.telegram.org/bot<INSERT YOUR TOKEN HERE>/getUpdates | grep -oP '(?<="from":{"id":)\w+'`

## Test your connection with the bot

You can verify that your connection with the Telegram bot works by running `./telegram-msg.sh`. If you want to send a custom message, add `-m "A custom message"` as an argument to the script.
