# O backup do banco de dados SIP foi planejado para poder estar fazendo backup 1 vez no dia, devido ao grande fluxo de dados garantindo a garantia do armazenamento e evitar perda de dados caso tenha algum problema no servidor. 
# Caso o banco de dados trava devido à falha catastrófica de hardware ou energia ou um upgrade com falha para o banco de dados ou sistema temos acesso ao backup mais recente para poder esta fazendo o rollback do sistema.
# As pastas com os nomes dos dias da semana é criada com os backups todos os dias dentro do diretório /backups.

# /backups/dom
# /backups/seg
# /backups/ter
# /backups/qua
# /backups/qui
# /backups/sex
# /backups/sab

# E dentros dos respectivos diretórios são realizados os backups das bases de dados escolhidas.

Script

#!/bin/bash
data=$(/bin/date +%a)

rm -R ~/backups/${data}
mkdir ~/backups/${data}

mysqldump -u root -proot sip > ~/backups/${data}/database.sql

# ******************************

# redireciona o output para o crontab atual
crontab -l > minha_cron

# Faz o backup todo dia as três da manhã
echo "00 03 * * * scripit.sh" >> minha_cron

# Instalar o novo cron
crontab minha_cron
rm minha_cron

