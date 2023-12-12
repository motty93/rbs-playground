#!/bin/bash

rm -rf sig/prototype/*

docker exec -it playground bundle exec rbs prototype rb --out-dir=sig/prototype --base-dir=. app
