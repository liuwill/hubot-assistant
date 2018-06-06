#!/bin/bash

usage()
{
  echo "USAGE: $CALLER [-h] COMMANDS"
  echo "       $CALLER [ --help ]"
  echo "COMMANDS:"
  echo "    slack    运行slack机器人"
  echo "    bearychat     运行bearychat机器人"
  echo "Run '$CALLER COMMAND --help' for more information on a command."
  exit 1
}

if [ $# -ne 1 ] ; then
  usage
  exit 0
fi

if [[ $1 != "slack" && $1 != "bearychat" ]]
then
  usage
  exit 0
fi

if [ ! -d "$HUBOT_SLACK_TOKEN" ]
then
  if [ ! -f ".env" ]
  then
    echo '找不到环境变量'
    exit 1
  else
    for line in `cat .env`
    do
        config=(${line//=/ })
        export ${config[0]}=${config[1]}

        #export HUBOT_SLACK_TOKEN=$HUBOT_SLACK_TOKEN
    done
  fi
fi

exec bin/hubot -a $1
