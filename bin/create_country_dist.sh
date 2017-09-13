#!/bin/bash

home=$(pwd)
dir=$1

#Create neccessary data for pie chart
#We changed to specified scratch directory
cd $dir

#Searches and displays content of falied_login_data.text
#Then using awk to print the fourth column (usersNames) and we get a count for each unique user name and output that to .txt
grep -rh --include="failed_login_data.txt" . | awk '{print $5}' | cat  > ip1.txt

cd $home
cd etc 
cp country_IP_map.txt $home/$dir 
cd $home/$dir
cat ip1.txt | sort > ip2.txt
join ip2.txt country_IP_map.txt > out.txt


cat out.txt | awk '{print $2}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | cat > countries.txt
rm out.txt ip1.txt ip2.txt

mv countries.txt $home
cd $home 

#Run wrap contents to create html file
sh ./bin/wrap_contents.sh countries.txt html_components/country_dist country_dist.html


#Finally move html file  to the specified directory
mv country_dist.html $dir

rm countries.txt



