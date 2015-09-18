#!/bin/bash
set -v

/usr/sbin/sshd -D &
cd /ansible/
source ./hacking/env-setup
cd /ansible/test/integration

# TODO: role_synchronize hanging
#export TEST_FLAGS="-vvvvv --skip-tags \"test_synchronize\""
export TEST_FLAGS="-vvvvv --tags \"test_copy\""
export CREDENTIALS_FILE=""
make non_destructive #&& make destructive

