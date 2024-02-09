#!/bin/bash

grype db update

apiKey=apikey

curl -o /tmp/vulners_grype.tar.gz -L "https://vulners.com/api/v3/grype/download?apiKey='$apiKey'"

grype db import /tmp/vulners_grype.tar.gz



