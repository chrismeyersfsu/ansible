#!/bin/bash
set -ev

/usr/sbin/sshd -D &
cd /ansible/
source ./hacking/env-setup
cd /ansible/test/integration

# TODO: role_synchronize hanging
#export TEST_FLAGS="-vvvvv --skip-tags \"test_synchronize\""
export TEST_FLAGS="-vvvvv --tags \"\""
export CREDENTIALS_FILE=""
echo "Shell pid $BASHPID"
(
echo "Subshell pid $BASHPID"
make non_destructive
) #&& make destructive

