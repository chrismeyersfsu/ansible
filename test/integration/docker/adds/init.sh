#!/bin/bash

/usr/sbin/sshd -D &
cd /ansible/
source ./hacking/env-setup
cd /ansible/test/integration
make non_destructive && make destructive

