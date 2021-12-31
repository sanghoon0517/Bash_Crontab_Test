#!/bin/sh

/root/bin/git config --global user.name sanghoon0517
/root/bin/git config --global user.email jsh940517@daum.net
/root/bin/git config --global user.mail jsh940517@daum.net
/root/bin/git config --list > /root/silk/Bash_Crontab_Test/git_id_check

cd /root/silk/Bash_Crontab_Test/

/root/bin/git add .

/root/bin/git checkout -b main

if [ "$(cat /root/silk/Bash_Crontab_Test/test.txt | wc -l)" -gt 30 ]; then
        sed -i '1,30d' /root/silk/Bash_Crontab_Test/test.txt
fi


echo $(date) >> /root/silk/Bash_Crontab_Test/test.txt

/root/bin/git add .

eval $(ssh-agent -s)

ssh-add ~/.ssh/jsh

/root/bin/git commit -am "$(date) commit test" 

/root/bin/git push --set-upstream origin main


