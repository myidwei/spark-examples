#!/bin/sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /wordcount/input/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /wordcount/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../test-data/test.txt /wordcount/input/
/usr/local/spark/bin/spark-submit --master=spark://node-0:7077 ./wordcount.py hdfs://node-0:9000/wordcount/input/
