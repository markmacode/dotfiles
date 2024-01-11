#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install pinentry-tty gnupg2
sudo update-alternatives --config pinentry

gpg --gen-key
