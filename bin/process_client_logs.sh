#!/bin/bash


dir=$1

cd ..
cd $dir 
grep -rh . | awk '{
if (($6=="Failed")&&($10 == "user")){
		{print ($1, $2, substr($3,0,2),$11,$13);}
	}
else if(($6 == "Failed")){
	       	{print ($1, $2, substr($3,0,2),$9,$11);}
	}
	}' | cat > failed_login_data.txt

