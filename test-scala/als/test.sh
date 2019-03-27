#!/bin/sh
mvn clean package
/usr/local/spark/bin/spark-submit --class SparkALS --master=spark://node-0:7077 target/ALS-1.0-SNAPSHOT.jar
mvn clean
