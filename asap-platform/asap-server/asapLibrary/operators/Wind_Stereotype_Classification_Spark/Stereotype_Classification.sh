#!/bin/bash

<<INFO
Author				: Papaioannou Vassilis
Last update			: 29/ 01/ 2016 
Previous updates	: none
Host System			: Ubuntu
Hadoop				: 2.7.1
INFO

<<DESCRIPTION
pyspark user_annotation.py <region> <timeframe>

Input parameters:

region		: a string containing the name of the region related to the dataset
timeframe	: a string containing the period related to the dataset

Output: It stores a file “sociometer<region>-<timeframe>” containing the percentage
		of user of each profile. E.g. roma-center, Resident, 0.34

DESCRIPTION

echo -e "Starting user_annotation.py script ..."
#pass command line arguments explicitly
#pyspark user_annotation.py roma 06-2015
#pass command line arguments implicitly through description file
pyspark user_annotation.py $1 $2
echo -e "... user_annotation.py script ended"
