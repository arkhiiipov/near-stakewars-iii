# Connect a node validator for sending notifications through Notifi

## Getting credentials

I got credentials on my e-mail on the second day after completeng form by link shared [#integration-requests](https://discord.com/invite/nAqR3mk3rv) in Discord channel.

![img](../images/monitoring/notifi-service-credentials.png)

## Apply script

```bash
git clone https://github.com/arkhiiipov/notifi-sdk-ts.git

cd notifi-near-integration

npm i

cp example.env .env

nano .env
```

```bash
POOL_ID="xx.factory.shardnet.near"
NODE_IP=127.0.0.1
SID=******************************
SECRET='****************************************'
TOPIC=*******************************
```

```bash 

npm run build

node build/index.js
```

```bash

which node

```

Everething is ok I got e-mail message

