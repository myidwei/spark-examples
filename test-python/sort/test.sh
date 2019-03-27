#!/bin/sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /sort/input/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /sort/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../test-data/sort.txt /sort/input/
/usr/local/spark/bin/spark-submit --master=spark://node-0:7077 ./sort.py hdfs://node-0:9000/sort/input/
