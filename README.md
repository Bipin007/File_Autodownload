# File_Autodownload
Goal Summary

Download and/or stream a bunch of public log data, filter it, insert it into a db then query

that db for an aggregated resultset

Useful info

• Data input: 4 x gzip data files from (https://dumps.wikimedia.org/other/pagecounts-raw/

2015/2015-12/) containing millions of rows of Wikimedia web server access log data

• https://dumps.wikimedia.org/other/pagecounts-raw/2015/2015-12/

pagecounts-20151201-000000.gz

• https://dumps.wikimedia.org/other/pagecounts-raw/2015/2015-12/

pagecounts-20151201-010000.gz

• https://dumps.wikimedia.org/other/pagecounts-raw/2015/2015-12/

pagecounts-20151201-020000.gz

• https://dumps.wikimedia.org/other/pagecounts-raw/2015/2015-12/

pagecounts-20151201-030000.gz

• Data schema: [String project_name] [Int num_requests] [Int content_size]

Instructions

• Download or stream the data from the 4 gzip data files listed above and ingest the data

• Filter the data as follows:

• select lines where project_name begins with the letter e

• ignore lines where project_name has only a single row/line

• From the filtered subset of rows:

• aggregate the data for each remaining project_name by:

• total number of requests

• total content_size

• Insert this data into a database (mysql or postgresql) table

• Query this table to show the top 50 project_names, along with the total number of requests

and total content_size, sorted by total number of requests in descending order

Deliverables

• Code used to download/stream, filter, and aggregate the data

• Code used to create the db table and insert the data

• Code/SQL used to query the table

• Captured output of the above query showing the top 50 resultset
