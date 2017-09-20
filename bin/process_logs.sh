#!/bin/bash


home=$(pwd)
mkdir tmpScratch

#This loop will loop over all command line args and will untar secure files into tmpScratch
for var in "$@" 
do 
	#Gets the name of the *_secure.tgz and the 2nd var removes the .tgz
	var1="${var##*/}"
	var2="${var1%.*}"
	mkdir tmpScratch/$var2

	#Untar the files into specified directory
	tar -xf $var -C tmpScratch/$var2

	
	#call process_client_logs.sh to create failed_login_data.txt
	sh ./bin/process_client_logs.sh tmpScratch/$var2
	
done

#Then we will call helper scripts to create neccessary files
sh ./bin/create_username_dist.sh tmpScratch
sh ./bin/create_hours_dist.sh tmpScratch
sh ./bin/create_country_dist.sh tmpScratch
sh ./bin/assemble_report.sh tmpScratch

#Finally we will move the file we want to our top directory and cleanup
mv tmpScratch/failed_login_summary.html $home
rm -rf tmpScratch

