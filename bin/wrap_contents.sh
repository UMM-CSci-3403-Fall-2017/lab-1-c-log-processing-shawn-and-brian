#!/bin/bash

#assigning all variables 
file=$1
name=$2
head='_header.html'
foot='_footer.html'
header=$name$head
footer=$name$foot

#Wraps contents of $file with $name and ouputs to newly made target file 
cat $header $file $footer > $3


