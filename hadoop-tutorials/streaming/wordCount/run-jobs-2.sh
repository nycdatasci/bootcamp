#!/bin/bash
data_dir=wordcount
# check data input/output
if ! $(hadoop fs -test -d $data_dir) ; then
    echo "Creating $data_dir directory"
    hadoop fs -mkdir $data_dir
fi
if ! $(hadoop fs -test -d $data_dir/input) ; then
    echo "Adding input file(s) to hdfs"
    hadoop fs -put ../../data/wordCount_input/ $data_dir/input;
fi
if $(hadoop fs -test -d $data_dir/output) ; then
    echo "Removing output directory from hdfs"
    hadoop fs -rm -r $data_dir/output
fi
# run streaming job
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.8.4.jar \
    -files mapper.py,reducer.py \
    -input $data_dir/input \
    -output $data_dir/output \
    -mapper mapper.py \
    -reducer reducer.py \
    -combiner reducer.py

