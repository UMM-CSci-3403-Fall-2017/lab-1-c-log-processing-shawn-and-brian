#!/bin/bash
home=$(pwd)
#Change to specified scratch dir 
dir=$1
cd $dir

#list all content of files in directories
#Using awk we check columns then print specfied columns
#At the end we save the specified columns into failed_login_data.txt

grep -rh . | awk  '/Failed password for/{
if ($10 == "user" && $9=="invalid"){
		print ($1, $2, substr($3,0,2),$11,$13);
	}
else {
	       	print ($1, $2, substr($3,0,2),$9,$11);
	}
	}'> failed_login_data.txt

