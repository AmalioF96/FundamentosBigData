#! /bin/bash



cd /tmp/wordCount

# Check for cyrusprint.txt - this is the file we will use for Wordcount
ls -altrh cyrusprint.txt 

# Check for the number of words in cyrusprint.txt (1,953,931)
wc -w cyrusprint.txt 

# Step 2: Execute the following steps to copy the final file, named cyrusprint.txt to HDFS, create the mapper.py and reducer.py scripts.
## The files, mapper.py and reducer.py were referenced from Glenn Klockwood’s website (http://www.glennklockwood.com/data-intensive/hadoop/streaming.html), which provides a wealth of information on MapReduce and related topics in general
# Check the contents of the HDFS directory /user/cloudera
hdfs dfs -ls /user/cloudera

# Create /user/cloudera/input in HDFS
hdfs dfs -mkdir /user/cloudera/$1

# Copy cyrusprint.txt to /user/cloudera/input directory
hdfs dfs -put cyrusprint.txt /user/cloudera/$1/
chmod 755 *.py

#Step 3: Execute the mapper and reducer scripts which will perform the MapReduce operations in order to produce the Word Count. You may see error messages as shown below, but for the purpose of this exercise (and for generating the results), you may disregard them.
# The command to start the MapReduce Job is as follows:
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar -input /user/cloudera/$1 -output /user/cloudera/$2 -mapper /tmp/wordCount/mapper.py -reducer /tmp/wordCount/reducer.py

#Step 4: The results are stored in HDFS under the /user/cloudera/output director in files with part- prefix
# Check for the results file that will be available under /user/cloudera/output directory
hdfs dfs -ls /user/cloudera/$2

# Step 5: To view the contents of the file use hdfs dfs –cat and provide the name of the file. In this case we are viewing the first 10 lines of the output.
hdfs dfs -cat /user/cloudera/$2/part-00000 | head -100
