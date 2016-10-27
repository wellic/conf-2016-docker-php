MYSQL_HOST=dev_mysql
MYSQL_USER=root
MYSQL_PASS=root

MAX_CNT=90
TIME_SLEEP=3
CNT=0

wait_load_mysql() {
    while [ $CNT -le $MAX_CNT ]
    do
        if mysql -h${MYSQL_HOST} -u"$MYSQL_USER" -p"$MYSQL_PASS" -e 'show databases;' | grep -qP '\bmysql\b' ; then 
            echo -e '\n* Mysql ready !!!'
            return 0
        fi
        sleep $TIME_SLEEP
        CNT=$(( $CNT + 1 ))
    done
    return 1
}

wait_load_mysql || exit 1
