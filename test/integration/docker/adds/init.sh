#!/bin/bash

/usr/sbin/sshd -D &
cd /ansible/
source ./hacking/env-setup
cd /ansible/test/integration

# TODO: role_synchronize hanging
export TEST_FLAGS="-vvvvv --skip-tags \"test_synchronize,test_handlers\""
export CREDENTIALS_FILE=""
make non_destructive && make destructive

