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
# run mrJob
python3 wordCountMRJob-combiner.py -r hadoop hdfs:///user/hadoop/$data_dir/input/* \
    --output-dir hdfs:///user/hadoop/$data_dir/output/
