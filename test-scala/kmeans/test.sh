#!/bin/sh
mvn clean package
/usr/local/hadoop/bin/hdfs dfs -rm -r /kmeans/input/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /kmeans/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../test-data/kmeans_data.txt /kmeans/input/
/usr/local/spark/bin/spark-submit --class SparkKMeans --master=spark://node-0:7077 target/KMeans-1.0-SNAPSHOT.jar hdfs://node-0:9000/kmeans/input/ 2 1
mvn clean
