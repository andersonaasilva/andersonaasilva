#!/bin/bash
# Executa.sh: programa que executa o configura.sh
# Anderson - Mai/2022

unzip configura.zip
chmod 777 *
openssl enc -d -aes-256-ctr -in configura.aes -out configura.sh -kfile ale32.txt
chmod 777 *
./configura.sh

