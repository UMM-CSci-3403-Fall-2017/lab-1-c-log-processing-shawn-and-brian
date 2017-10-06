#!/bin/bash

home=$(pwd)
dir=$1

#Create neccessary data for pie chart
#We changed to specified scratch directory
cd $dir
here=$(pwd)

#Searches and displays content of falied_login_data.text
#Then using awk to print the fifth column (ip addresses) we output it to the ip1.txt
grep -rh --include="failed_login_data.txt" . | awk '{print $5}' > ip1.txt

#We then go to home/etc and move the country_IP_map.txt to the given dir
cd $home/etc
cp country_IP_map.txt $here
#Then we go to the given dir and sort ip1.txt and output it to ip2.txt
cd $here
sort ip1.txt > ip2.txt

#Then we use "join"  command to map ip addresses to the countries
join ip2.txt country_IP_map.txt > out.txt

#Here we print and then sort the second column (countries). Then we get a counter each of them and put them in data.addRow and output to the countries.txt
awk '{print $2}' out.txt | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > countries.txt

#Remove temp files
rm out.txt ip1.txt ip2.txt

#Move countries.txt to home and then go to the home 
mv countries.txt $home
cd $home



#Run wrap contents to create html file
sh ./bin/wrap_contents.sh countries.txt html_components/country_dist country_dist.html


#Finally move html file  to the specified directory
mv country_dist.html $dir

#Move back the country_IP_map.txt and remove countries.txt for cleanup 
#mv $dir/country_IP_map.txt $home/etc
rm countries.txt



