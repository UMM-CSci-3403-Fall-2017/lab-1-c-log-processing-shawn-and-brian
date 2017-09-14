dir=$1

home=$(pwd)
cd $dir

#combine all html files and output it into tmp.txt
cat country_dist.html hours_dist.html username_dist.html > tmp.txt

#move tmp.txt to the home directory
mv tmp.txt $home
cd $home

#run the wrap_contents.sh to wrap the text file in summary plot contents
sh ./bin/wrap_contents.sh tmp.txt html_components/summary_plots failed_login_summary.html

#cleanup
rm tmp.txt

mv failed_login_summary.html $dir 


