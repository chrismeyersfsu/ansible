#!/bin/bash

/usr/sbin/sshd -D &
cd /ansible/
source ./hacking/env-setup
cd /ansible/test/integration

export TEST_FLAGS="-vvvvv --skip-tags \"role_synchronize\""
export CREDENTIALS_FILE=""
make non_destructive && make destructive

