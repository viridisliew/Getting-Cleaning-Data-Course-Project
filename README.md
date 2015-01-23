# Getting-Cleaning-Data-Course-Project
### Purpose of project

The purpose of this project is to achieve a tidy data set with the average of choosen variables for each activity and each subject from a given set of raw data. 

It can be achieved by following the steps below.


1. Download the data from the link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the data into a folder. You should have there a folder called "UCI HAR Dataset".

3. Copy the contents of "UCI HAR Dataset" folder into your working directory.

4. Put the "run_analysis.R" script to your working directory.

5. Run source("run_analysis.R")

6. You should have there a new file called TidyData.txt in your working directory

### Required packages

The "run_analysis.R" script requires a package "reshape2" to be installed (if you are taking the Getting and Cleaning Data course you most probably have it already installed).


### What steps the R script takes?

The script does the following:

1. Reading in the test set and the training set with the descriptive variable names. Also the subject and activity ids:
    * Reading the test and the training sets with the descriptive variable names.
    * Adding to the data sets the id numbers of activities.
    * Adding to the data sets the id numbers of subjects.

    As a result you have two data frames one for test data, other for train data, each with variables and also subject and activity ids.

2. Merging the test and the training data sets to one data set.

    As a result you have a data frame called merged.data

3. Using descriptive activity names to name the activities in the data set.

    In this step the activity id is replaced by the activity name.
    There are 6 different activity names: walking, walking_upstairs, walking_downstairs, sitting, standing, laying.

4. Extracting only the measurements on the mean and standard deviation for each measurement.

    Mean and standard deviation variables are extracted by the function `"grep"`, also the information about the activity and the subject is added.

    According to a variables description from the original source the mean and standard deviation variables are those with thie part of a name like:
    * mean(): Mean value
    * std(): Standard deviation

    That means that as a result we have an extracted.data

5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

    This step is achieved by melting the extracted data set by "Activity" and "Subject" an then using the function `"dcast"` with the mean as the aggregator function.

    Melt the dataset by specifying activity ID, name and subject ID as the only ID variables.


6. Saving the result in the `"TidyData.txt"