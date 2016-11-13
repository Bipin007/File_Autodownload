#!/bin/sh
i=2
dir=$HOME
echo "Sir,please have a cup of tea ... All URL content will be downloaded to $dir/Ops_resultant_file.txt ....."
for url in https://dumps.wikimedia.org/other/pagecounts-raw/2015/2015-12/pagecounts-20151201-000000.gz https://dumps.wikimedia.org/other/pagecounts-raw/2015/2015-12/pagecounts-20151201-010000.gz https://dumps.wikimedia.org/other/pagecounts-raw/2015/2015-12/pagecounts-20151201-020000.gz https://dumps.wikimedia.org/other/pagecounts-raw/2015/2015-12/pagecounts-20151201-030000.gz
do
curl -s $url | gunzip >> $dir/Ops_resultant_fil.txt
j=`expr $i - 1`
echo "Result of URL $j has been copied successfully,progressing ....."
i=`expr $i + 1`
done
echo "All URL CONTENT has been copied to $dir/Ops_resultant_file.txt\n" 
echo "Result of Project_Name starting with e is coping to $dir/Ops_proj_strt_with_e.txt ...."
cat $dir/Ops_resultant_fil.txt | awk '{print $2"  "$3"  "$4}' > $dir/Ops_resultant_file.txt
cat $dir/Ops_resultant_file.txt | grep "^e" > $dir/Ops_proj_strt_with_e.txt
cat $dir/Ops_resultant_file.txt | grep "^e" | sort | uniq -d | sort > $dir/Ops_final_filtered_file.txt
echo "Ignoring Project_Name that occur only one and result is copied to $dir/Ops_final_filtered_file ....\n"
sleep 05
cat $dir/Ops_final_filtered_file.txt | awk '{print $1"   "$2}' | grep "^e" | awk '{arr[$1]+=$2} END {for (i in arr) {print i,arr[i]}}' > $dir/Ops_no_request.txt
cat $dir/Ops_final_filtered_file.txt | awk '{print $1"   "$3}' | grep "^e" | awk '{arr[$1]+=$2} END {for (i in arr) {print i,arr[i]}}' > $dir/Ops_cont_size.txt
awk 'NR==FNR{a[NR]=$2; next} {print "INSERT INTO table_name values("$1","$2","a[FNR]");"}' $dir/Ops_cont_size.txt $dir/Ops_no_request.txt > $dir/Ops_insert_query_db.txt
echo "I hope your Tea was Awesome !!!"
echo "Thank You for your patience,please review all the file generated at home directory\n\n"
# -------------------------------------------- Logic for database connectivity---------------------------------------------
<<COMMENT
In order to connect any database we just have to connect through
mysql hostname/username/password;

2)  Code to create db and insert the data into it.
Schema --> [String project_name] [Int num_requests] [Int content_size]
Create Table table_name 
(
project_name varchar(512) PRIMARY KEY,
num_requests BIGINT,
content_size BIGINT
);

Insert into table_name values('project_name', num_requests, content_size);

3) Code to query the table.

Select * from db_name.table_name;

4) Top 50 output of query.(using MySql):
Select * from db_name.table_name order by num_requests desc LIMIT 50; # It will generate top 50 results from table_name


COMMENT
