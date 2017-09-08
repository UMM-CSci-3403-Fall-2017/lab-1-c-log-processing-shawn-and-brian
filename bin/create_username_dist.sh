#!/bin/bash

dir=$1


#Create neccessary data for pie chart
cd $dir
grep -rh --include="failed_login_data.txt" . | awk '{print $4}' | sort | uniq -c | sort -nr | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);"}' > temp.txt

mv temp.txt ..
cd ..
sh bin/./wrap_contents.sh temp.txt html_components/username_dist username_dist.html

mv username_dist.html $dir
