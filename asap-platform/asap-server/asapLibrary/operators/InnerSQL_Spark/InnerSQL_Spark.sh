#!/bin/bash

echo -e "InnerSQL_Spark\n"

SPARK_PORT=$1
OPERATOR=$2
HOST=$3
YARN_HOME=$4
SQL_QUERY=$5
HDFS=/user/hive/warehouse
TABLE=part_agg

SPARK_HOME=/opt/spark
HADOOP_HOME=/opt/hadoop-2.7.0

echo -e "$SPARK_PORT"
echo -e "$OPERATOR"
echo -e "$HOST"
echo -e "$YARN_HOME"
echo -e "$SQL_QUERY\n"

$HADOOP_HOME/bin/hdfs dfs -rm -r $HDFS/$TABLE.parquet
$SPARK_HOME/bin/spark-submit --executor-memory 2G --driver-memory 512M  --packages com.databricks:spark-csv_2.10:1.4.0 --master $SPARK_PORT $OPERATOR $HOST $YARN_HOME $SQL_QUERY $TABLE

#clean /tmp
$HADOOP_HOME/bin/hdfs dfs -rm $HDFS/$TABLE.csv
