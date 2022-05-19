#!/bin/bash
# Executa.sh: programa que executa o configura.sh na maquina CentOS
# Anderson - Mai/2022

# local do arquivo https://raw.githubusercontent.com/andersonaasilva/andersonaasilva/pi/configura.zip

#unzip -o configura.zip

# decifra configura.aes
chmod 777 *
openssl enc -d -aes-256-ctr -in configura.aes -out configura.sh -kfile ale32.txt
chmod 777 *

# executa configura.sh
./configura.sh

# apaga configura.sh depois da execucao
rm ./configura.sh
