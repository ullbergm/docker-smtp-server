#!/bin/sh
./wait-for-it.sh -t 15 proxy:25

curl --url 'smtp://proxy:25' --mail-from 'testing@localdomain' --mail-rcpt 'testing@localdomain' --upload-file test.msg

