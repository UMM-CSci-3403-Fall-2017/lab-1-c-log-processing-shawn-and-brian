#!/bin/bash
home=$(pwd)
dir=$1

#Create neccessary data for pie chart
#We changed to specified scratch directory
cd $dir

#Searches and displays content of falied_login_data.text
#Then using awk to print the third column (hour) and we get a count for each hour and output that to .txt	
grep -rh --include="failed_login_data.txt" . | awk '{print $3}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);"}' > temp1.txt

#We move the text file one directory back
mv temp1.txt $home

#And go one directory back
cd $home

#Run wrap contents to create html file
sh ./bin/wrap_contents.sh temp1.txt html_components/hours_dist hours_dist.html


#Finally move html file  to the specified directory 
mv hours_dist.html $dir

rm temp1.txt

