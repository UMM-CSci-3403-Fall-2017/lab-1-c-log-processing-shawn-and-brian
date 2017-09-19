#!/bin/bash

home=$(pwd)

echo $home
mkdir tmpScratch

for var in "$@" 
do 

	mkdir "${var%.*}"
	tar -xf $var -C "${var%.*}"
	mv "${var%.*}" tmpScratch

	#call process_client
	sh ./bin/process_client_logs.sh tmpScratch/"${var%.*}"
	
done

mv tmpScratch log_files

sh ./bin/create_username_dist.sh log_files/tmpScratch
sh ./bin/create_hours_dist.sh log_files/tmpScratch
sh ./bin/create_country_dist.sh log_files/tmpScratch

sh ./bin/assemble_report.sh log_files/tmpScratch

cd log_files/tmpScratch
mv failed_login_summary.html $home
