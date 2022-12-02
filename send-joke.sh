#!/bin/bash -e
# A script to send a joke to gamez Discord channel.  Intended to be triggered by cron.

post_joke () {
  curl -s -H 'Content-Type: application/json' --data "{\"content\" : \"$PRELUDE \n$JOKE $SIGN_OFF \"}" "$WEBHOOK" > /dev/null
}

PRELUDE="First, a joke... \n"
JOKE=$(curl -s https://icanhazdadjoke.com)
WEBHOOK="$BETTY_WEBHOOK"
SIGN_OFF="\n\nghhya hahah haha haha - ENOUGH!"

if [ -z "$JOKE" ]; then
  PRELUDE="I'm bleeding which makes me the victor."
  JOKE="I rock.  And roll.  All night long.  Sweet suzy."
  WEBHOOK="$WIMPLO_WEBHOOK"
  SIGN_OFF=""
fi

post_joke

