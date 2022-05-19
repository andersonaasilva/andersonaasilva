#!/bin/bash
# Configura.sh: programa que configura a maquina CentOS
# Anderson - Mai/2022

# comando de criptografia
#openssl enc -aes-256-ctr -in configura.sh -out configura.aes -kfile ale32.txt -S 0
# comando de hash
#openssl dgst -md5 <anderson> 
# comando de compactacao
#zip configura.zip ale32.txt configura.aes executa.sh

# cria a pasta /pi e acerta a permissao
mkdir /pi
chmod 777 /pi
cd /pi

# bloqueia conexoes root no ssh 
#(NAO PRECISA, PORQUE EVITA A QUEBRA DA SENHA DE RROT NO MEDUSA E NO XHYDRA)
#sed -i 's/PermitRootLogin no/#PermitRootLogin no/' /etc/ssh/sshd_config
#sed -i 's/PermitRootLogin yes/#PermitRootLogin yes/' /etc/ssh/sshd_config
#echo PermitRootLogin no >> /etc/ssh/sshd_config
#systemctl restart sshd.service

# apaga usuarios
userdel fulano
userdel beltrano
userdel cicrano
userdel admin
userdel americano
userdel alemao
userdel frances
userdel espanhol
userdel italiano
userdel brasileiro
userdel russo

# adiciona usuarios (sem senha)
useradd fulano
useradd beltrano
useradd cicrano
useradd admin
useradd americano
useradd alemao
useradd frances
useradd espanhol
useradd italiano
useradd brasileiro
useradd russo

# apaga a senha do root (para mudar o padrao da entrada do arquivo /etc/shadow)
passwd -d root
# apaga a senha do azureuser (para mudar o padrao da entrada do arquivo /etc/shadow)
passwd -d azureuser

# muda o modo do arquivo /etc/shadow para alteração
cp /etc/shadow /etc/shadow.default
chmod 600 /etc/shadow

# repassa hash de senhas para o arquivo /etc/shadow (usei \/ no lugar de /)
# root
#sed -i 's/root:!!:/root:$6$1.b0mEeJ$FqqUy89xo9TkKUAEm7zXrJM\/wlReSJRwxbmZPTJJCNP7Zvd3Ww7plfZb6e74SSuXKCL3KuzvMwnU6VkQwoYat.:/' /etc/shadow
#sed -i 's/:*LOCK*:/:$6$1.b0mEeJ$FqqUy89xo9TkKUAEm7zXrJM\/wlReSJRwxbmZPTJJCNP7Zvd3Ww7plfZb6e74SSuXKCL3KuzvMwnU6VkQwoYat.:/' /etc/shadow
sed -i 's/root:x:/root:$6$1.b0mEeJ$FqqUy89xo9TkKUAEm7zXrJM\/wlReSJRwxbmZPTJJCNP7Zvd3Ww7plfZb6e74SSuXKCL3KuzvMwnU6VkQwoYat.:/' /etc/shadow
sed -i 's/root::/root:$6$1.b0mEeJ$FqqUy89xo9TkKUAEm7zXrJM\/wlReSJRwxbmZPTJJCNP7Zvd3Ww7plfZb6e74SSuXKCL3KuzvMwnU6VkQwoYat.:/' /etc/shadow
# azureuser
#sed -i 's/azureuser:!!:/#azureuser:$6$TM0dWH5SufUDCVSS$WW1.nMf7Gd3QbO1zSfrjHAjfJiHIpBnCoCYsAudbUH9E7uBvXuw92NY2UEyTTBcurQA49ka5oMdIIq5FRckSl1:/' /etc/shadow
sed -i 's/azureuser::/azureuser:$6$TM0dWH5SufUDCVSS$WW1.nMf7Gd3QbO1zSfrjHAjfJiHIpBnCoCYsAudbUH9E7uBvXuw92NY2UEyTTBcurQA49ka5oMdIIq5FRckSl1:/' /etc/shadow
# outros usuarios
sed -i 's/fulano:!!:/fulano:$6$Ia1yYU0R$Lf7Z3aYy1WfSQL5Ir9wLHKDzqVdzDiGvh22ATcKVywGbW.pCdu3AXWq8RkygG6959a4Sr8KLoBYeCGPaYgxxu0:/' /etc/shadow
sed -i 's/beltrano:!!:/beltrano:$6$A.KQfnHB$8fABskX\/kX2Q9r8KaDxQ74N5sq9sBWQH6vpr1yV6GaRUzY6A4h4IFlXlJgtxf2MrTbdazdYQlOk22SZZSov7B0:/' /etc/shadow
sed -i 's/cicrano:!!:/cicrano:$6$tfOUvCa2$26MuBjZbAzp4DeSHsuY1F2bfiVXxrpooU0PrSOlOpoqIXIOG\/aYzLAWx6SozSFvogUWmBuaL5m\/LRhbZPpPSY0:/' /etc/shadow
sed -i 's/admin:!!:/admin:$6$z\/s0Nnw1$KIvTIrmiDMjbWPDUNSD2tpG2UGaA4jBcTw4E\/gsHgQ2bdyPvkubbtKOG3SRZsp1urAB5vO62mWgGSVFzG6kzV1:/' /etc/shadow
sed -i 's/americano:!!:/americano:$6$AgUKJh2P$Sb1VmrkCxSB9LWoSaqSA9X04YIZvAexa1uztAcD0PH4zY\/mIrZLTaaRyhbKEhbpyTgFmKCXLIDpSibt80ruPL\/:/' /etc/shadow
sed -i 's/alemao:!!:/alemao:$6$W.7ep6oQ$JvrJZjrGwD0l\/7r3RKZo9A.XG7Bc\/lJOfZlD399.roEffCIXB8fZdcdVBLkAeIMuCsYRwjyhamPvBO1aGVC4o1:/' /etc/shadow
sed -i 's/frances:!!:/frances:$6$eLLPzO5z$KXdp9PAxa4aCIbyUz\/AcYbrBZjRTrCcXuYL8FrSQ4\/kADQqgUAf9buIsL.6RMiXB9onqD8t21XqYXrnp8J6Zv0:/' /etc/shadow
sed -i 's/espanhol:!!:/espanhol:$6$RbBlolu9$K8FJBMaJEKTCb0p3B2w4st6B\/7xig0Tzk5DZDJPv2\/r6TYzojJFYB7inDuDfKKf1pbk2wIpKeZnSf0\/LLKzEv\/:/' /etc/shadow
sed -i 's/italiano:!!:/italiano:$6$4QbFYqaq$ca0LNfApqUxpyJJkUZa20LdLe\/oa4VMA0RSGDuFOTRzR9fVxTfUAaAituhFVT37daXIbVqGg5COhxAQWBDPPL.:/' /etc/shadow
sed -i 's/brasileiro:!!:/brasileiro:$6$glunzobR$fBP.VuvVglk.KwnADwrf.XJCI9E8lSBQGspKVSM7I71OyZquodSJf\/oSeMvhRhg4IxI0cXTHT.JcSpOKgXWbd.:/' /etc/shadow
sed -i 's/russo:!!:/russo:$6$ud8JpmIe$\/lsgOm1hC9wH2zUh4pEX3nlMuMuX92VQN7a8WTGD6UYuStGwt74wIYtnubDeRwajTg1ymodmCo6J0gqeT5QhS1:/' /etc/shadow

# hashes originais de senha (sem a troca de / por \/)
#root:$6$1.b0mEeJ$FqqUy89xo9TkKUAEm7zXrJM/wlReSJRwxbmZPTJJCNP7Zvd3Ww7plfZb6e74SSuXKCL3KuzvMwnU6VkQwoYat.:
#azureuser:$6$TM0dWH5SufUDCVSS$WW1.nMf7Gd3QbO1zSfrjHAjfJiHIpBnCoCYsAudbUH9E7uBvXuw92NY2UEyTTBcurQA49ka5oMdIIq5FRckSl1:
#fulano:$6$Ia1yYU0R$Lf7Z3aYy1WfSQL5Ir9wLHKDzqVdzDiGvh22ATcKVywGbW.pCdu3AXWq8RkygG6959a4Sr8KLoBYeCGPaYgxxu0:
#beltrano:$6$A.KQfnHB$8fABskX/kX2Q9r8KaDxQ74N5sq9sBWQH6vpr1yV6GaRUzY6A4h4IFlXlJgtxf2MrTbdazdYQlOk22SZZSov7B0:
#cicrano:$6$tfOUvCa2$26MuBjZbAzp4DeSHsuY1F2bfiVXxrpooU0PrSOlOpoqIXIOG/aYzLAWx6SozSFvogUWmBuaL5m/LRhbZPpPSY0:
#admin:$6$z/s0Nnw1$KIvTIrmiDMjbWPDUNSD2tpG2UGaA4jBcTw4E/gsHgQ2bdyPvkubbtKOG3SRZsp1urAB5vO62mWgGSVFzG6kzV1:
#americano:$6$AgUKJh2P$Sb1VmrkCxSB9LWoSaqSA9X04YIZvAexa1uztAcD0PH4zY/mIrZLTaaRyhbKEhbpyTgFmKCXLIDpSibt80ruPL/:
#alemao:$6$W.7ep6oQ$JvrJZjrGwD0l/7r3RKZo9A.XG7Bc/lJOfZlD399.roEffCIXB8fZdcdVBLkAeIMuCsYRwjyhamPvBO1aGVC4o1:
#frances:$6$eLLPzO5z$KXdp9PAxa4aCIbyUz/AcYbrBZjRTrCcXuYL8FrSQ4/kADQqgUAf9buIsL.6RMiXB9onqD8t21XqYXrnp8J6Zv0:
#espanhol:$6$RbBlolu9$K8FJBMaJEKTCb0p3B2w4st6B/7xig0Tzk5DZDJPv2/r6TYzojJFYB7inDuDfKKf1pbk2wIpKeZnSf0/LLKzEv/:
#italiano:$6$4QbFYqaq$ca0LNfApqUxpyJJkUZa20LdLe/oa4VMA0RSGDuFOTRzR9fVxTfUAaAituhFVT37daXIbVqGg5COhxAQWBDPPL.:
#brasileiro:$6$glunzobR$fBP.VuvVglk.KwnADwrf.XJCI9E8lSBQGspKVSM7I71OyZquodSJf/oSeMvhRhg4IxI0cXTHT.JcSpOKgXWbd.:
#russo:$6$ud8JpmIe$/lsgOm1hC9wH2zUh4pEX3nlMuMuX92VQN7a8WTGD6UYuStGwt74wIYtnubDeRwajTg1ymodmCo6J0gqeT5QhS1:

# retorna o modo do arquivo /etc/shadow para so leitura
chmod 400 /etc/shadow


# instala servidor web como servico
yum install httpd -y
yum update httpd -y
systemctl start httpd
systemctl enable httpd.service

# instala servidor ftp como servico
yum install vsftpd -y
yum update vsftpd -y
systemctl start vsftpd
systemctl enable vsftpd.service
