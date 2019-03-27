#!/bin/sh
mvn clean package
/usr/local/spark/bin/spark-submit --class SparkPi --master=spark://node-0:7077 target/PI-1.0-SNAPSHOT.jar
mvn clean
