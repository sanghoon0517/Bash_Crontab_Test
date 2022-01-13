#!/bin/sh

/usr/local/cpanel/3rdparty/lib/path-bin/git config --global user.name sanghoon0517
/usr/local/cpanel/3rdparty/lib/path-bin/git config --global user.email jsh940517@daum.net
/usr/local/cpanel/3rdparty/lib/path-bin/git config --global user.mail jsh940517@daum.net
/usr/local/cpanel/3rdparty/lib/path-bin/git config --list > /home/youngtec/git/Bash_Crontab_Test/git_id_check

cd /home/youngtec/git/Bash_Crontab_Test/

/usr/local/cpanel/3rdparty/lib/path-bin/git add .

/usr/local/cpanel/3rdparty/lib/path-bin/git checkout -b main

if [ "$(cat /home/youngtec/git/Bash_Crontab_Test/test.txt | wc -l)" -gt 30 ]; then
        sed -i '1,30d' /home/youngtec/git/Bash_Crontab_Test/test.txt
fi


echo $(date) >> /home/youngtec/git/Bash_Crontab_Test/test.txt

/usr/local/cpanel/3rdparty/lib/path-bin/git add .

eval $(ssh-agent -s)

ssh-add /home/youngtec/git/jsh

/usr/local/cpanel/3rdparty/lib/path-bin/git commit -am "$(date) commit test"

/usr/local/cpanel/3rdparty/lib/path-bin/git push --set-upstream origin main
