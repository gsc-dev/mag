# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'

#set -x

#export TERM=ansi
export TERM=xterm-256color
# export PATH=$PATH:/srv/www/bin

ulimit -s 65536

alias db='mysql --user="$MYSQL_USER" --password="$MYSQL_PASSWORD" "$MYSQL_DATABASE"'
alias own='chown -R www-data:www-data /srv /var/www'
alias owndev='chown -R www-data:www-data /srv/dev && chown -R www-data:www-data /var/www'
alias maguser='su -c "$*" -s /bin/sh www-data'
alias magento='bin/magento'
alias mag='bin/magento'
alias clean='mag cache:clean && mag cache:flush'
alias getmag='wget https://magento.mirror.hypernode.com/releases/magento2-latest.tar.gz'
alias maguser='su -c "b/install" -s /bin/sh www-data'
# alias maginstall='su -c "cp /root/.composer/auth.json ./ && bin/magento setup:install --db-host=$M2SETUP_DB_HOST --db-name=$M2SETUP_DB_NAME --db-user=$M2SETUP_DB_USER --db-password=$M2SETUP_DB_PASSWORD --base-url=$M2SETUP_BASE_URL --backend-frontname=$M2SETUP_ADMIN_URL --admin-firstname=$M2SETUP_ADMIN_FIRSTNAME --admin-lastname=$M2SETUP_ADMIN_LASTNAME --admin-email=$M2SETUP_ADMIN_EMAIL --admin-user=$M2SETUP_ADMIN_USER --admin-password=$M2SETUP_ADMIN_PASSWORD --language=$M2SETUP_LANGUAGE --currency=$M2SETUP_CURRENCY --timezone=$M2SETUP_TIMEZONE --use-secure=$M2SETUP_USE_SSL --base-url-secure=$M2SETUP_BASE_URL_SSL --use-secure-admin=$M2SETUP_USE_SSL_ADMIN --session-save=files $M2SETUP_OPTIONS" -s /bin/sh www-data'

cd /srv/dev

# IF ROOT USER
if [[ $EUID -eq 0 ]]; then
	chsh -s /bin/bash www-data
	su www-data
fi
