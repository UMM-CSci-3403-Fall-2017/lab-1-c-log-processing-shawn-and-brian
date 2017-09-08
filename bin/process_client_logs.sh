#!/bin/bash

#Change to specified scratch dir 
dir=$1
cd ..
cd $dir 

#list all content of files in directories
#Using awk we check columns then print specfied columns 
grep -rh . | awk '{
if (($6=="Failed")&&($10 == "user")){
		{print ($1, $2, substr($3,0,2),$11,$13);}
	}
else if(($6 == "Failed")){
	       	{print ($1, $2, substr($3,0,2),$9,$11);}
	}
	}' | cat > failed_login_data.txt
	#At the end we save the specified columns into failed_login_data.txt
