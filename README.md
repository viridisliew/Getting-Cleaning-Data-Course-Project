# Getting-Cleaning-Data-Course-Project
Purpose of project

The purpose of this project is to achieve from a row data a tidy data set with the average of choosen variables for each activity and each subject. It can be achieved by following the steps below.

Steps to take

1. Download the data from the link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the data into a folder. You should have there a folder called "UCI HAR Dataset".

3. Copy the contents of "UCI HAR Dataset" folder into your working directory.

4. Put the "run_analysis.R" script to your working directory.

5. Run source("run_analysis.R")

6. Check out your working directory, you should have there a new file called TidyData.txt

Required packages

The "run_analysis.R" script requires a package "reshape2" to be installed (if you are taking the Getting and Cleaning Data course you most probably have it already installed).

What steps the R script takes?

All the steps taken by the "run_analysis.R" script to achieve the tidy data set are fully described in the CodeBook file. You can also find there the description of the variables. Please find below the link to the CodeBook: https://github.com/https://github.com/viridisliew/Getting-Cleaning-Data-Course-Project/blob/master/CodeBook.md