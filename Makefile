server:
	bin/hubot -a slack

up:
	bin/hubot

deploy:
	npm install pm2 && pm2 startOrRestart process.yml
