# Grype-vulners-db

Enchance Grype security scanner with vulners.com database with AI based vulnerability scoring, exploit prediction, analytics and more:



- **vulnersScore** - [AI based](https://vulners.com/blog/ai-score/) vulnerability score
- **epss** - [Exploit Prediction Scoring System](https://vulners.com/blog/epss-exploit-prediction-scoring-system/) score
- **cvss2**, **cvss3** - CVSS v2 and v3 [scores](https://vulners.com/blog/cvss-common-vulnerability-scoring-system/)
- **aiDescription** - Shortened vulnerability description
- **aiTags** - Tags showing vulnerability types, vendor and product names
- **isWildExploited** - known facts of vulnerability exploited in the wild
- **exploitsCount** - number of known exploits for vulnerability
- **href** - link to vulnerability page on vulners.com

## Installation


- Clone repository

- set environment variable to disable auto updates (important for updating by schedule per day)
    
    `export GRYPE_DB_AUTO_UPDATE=false`

- replace Vulners apikey inside grype-vulners-db-update.sh, for example:

    `apiKey=ZNDI...DXI3S`

- replace path, username and group inside grype-vulners-update.service

    `User=your_username`

    `Group=your_group`

    `ExecStart=bin/bash /path/to/grype_vulners/grype-vulners-db-update.sh`

- make sh file executable

    `chmod +x /path/to/grype_vulners/grype-vulners-db-update.sh`


- add workers for databases daily updates 

    `systemctl daemon-reload`

    `systemctl enable /path/to/grype_vulners/grype-vulners-update.service`

    `systemctl enable /path/to/grype_vulners/grype-vulners-update.timer`

- start worker

    `systemctl start grype-vulners-update.timer`


## Compare it!

- update grype db without vulners db

    `grype db update`

- run command

    `grype debian -o json > grype_example.json`

- start worker following the instructions above and run command again

    `grype debian -o json > grype_vulners_example.json`
