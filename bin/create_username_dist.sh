#!/bin/bash

dir=$1


#Create neccessary data for pie chart
cd ..
cd $dir
awk -F '{print $4}' * | sort | uniq -c | sort -nr > file.txt | awk '{print data.addRow([egerteterterterterterter,5867]);}' 




