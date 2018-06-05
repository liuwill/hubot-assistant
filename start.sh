#!/bin/bash

if [ ! -d "$HUBOT_SLACK_TOKEN" ]
then
  if [ ! -f ".env" ]
  then
    echo '找不到环境变量'
    exit 1
  else
    source .env
  fi

fi

export HUBOT_SLACK_TOKEN=$HUBOT_SLACK_TOKEN

exec bin/hubot -a slack
