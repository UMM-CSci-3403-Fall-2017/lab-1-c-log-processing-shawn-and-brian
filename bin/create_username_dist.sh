#!/bin/bash

dir=$1


#Create neccessary data for pie chart
#We changed to specified scratch directory
cd $dir

#Searches and displays content of falied_login_data.text
#Then using awk to print the fourth column (usersNames) and we get a count for each unique user name and output that to .txt
grep -rh --include="failed_login_data.txt" . | awk '{print $4}' | sort | uniq -c | sort -nr | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);"}' > temp.txt

#We move the text file one directory back
mv temp.txt ..

#And go one directory back
cd ..

#Run wrap contents to create html file
sh bin/./wrap_contents.sh temp.txt html_components/username_dist username_dist.html


#Finally move html file  to the specified directory 
mv username_dist.html $dir
