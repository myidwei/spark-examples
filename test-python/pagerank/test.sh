#!/bin/sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /pagerank/input/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /pagerank/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../test-data/pagerank.txt /pagerank/input/
/usr/local/spark/bin/spark-submit --master=spark://node-0:7077 ./pagerank.py hdfs://node-0:9000/pagerank/input/ 5
