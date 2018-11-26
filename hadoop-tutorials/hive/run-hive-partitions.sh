#!/bin/bash
data_dir=population_partitions
if $(hadoop fs -test -d $data_dir) ; then
    hadoop fs -rm -r $data_dir
fi
echo "Adding $data_dir to hdfs"
    hadoop fs -put ../data/$data_dir $hdfs_dir
echo "Creating table population_partitions"
hive -f hive-create-partitions.hql
for i in $( ls ../data/$data_dir); do
    echo "Adding Partition year=$i"
    hive -e "LOAD DATA INPATH '$data_dir/$i' 
    INTO TABLE population_partitions
    PARTITION (year=$i)"
done