#!/bin/bash
for i in $( ls ../data/state-db/state-*.csv); do
    if ! $(hadoop fs -test -d $i) ; then
        echo "Adding data $i to hdfs"
        hadoop fs -put $i;
fi
done

echo "Create stata database in Hive"
hive -f hive-create-state-db.hql
