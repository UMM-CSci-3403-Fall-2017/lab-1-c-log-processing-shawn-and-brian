#!/bin/bash


dir=$1

cd ..
cd $dir/*/*/*
pwd
cat * | awk '{print $1 ,$2,substr($3,0,2), /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/, /\w+(?=\sfrom)/;}' > failed_login_data.txt

