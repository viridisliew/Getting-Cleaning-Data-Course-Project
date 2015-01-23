#
# This R script called run_analysis.R that does the following.
#
# - Read data and appropriately labels the data set with descriptive variable names.
# - Merges the training and the test sets to create one data set.
# - Uses descriptive activity names to name the activities in the data set
# - Extracts only the measurements on the mean and standard deviation
#    for each measurement.
# - Creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
#
# It is a prerequiste that the data files required are in the same folder as
# this R script. Data files can be obtained from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#

library(reshape2)

#-------------------------------------------------------------------------------------#
# Step 1 : Read data and appropriately labels the data set with descriptive variable names. ##
#-------------------------------------------------------------------------------------#

# Step 1a: Read data and and the names of the features for the data

features.names <- read.table("features.txt", colClasses="character")
features.names <- features.names[,2]

test.rawdata <- read.table("test/X_test.txt", col.names=features.names)
train.rawdata <- read.table("train/X_train.txt", col.names=features.names)


# Step 1b: Add the training activity id and test activity id to the raw data set

test.rawdata <- cbind(test.rawdata, read.table("test/y_test.txt", col.names="Activity"))
train.rawdata <- cbind(train.rawdata, read.table("train/y_train.txt", col.names="Activity"))


# Step 1c: Add the subjects id to the  training and test raw data set

test.rawdata <- cbind(test.rawdata, read.table("test/subject_test.txt", col.names="Subject"))
train.rawdata <- cbind(train.rawdata, read.table("train/subject_train.txt", col.names="Subject"))


#-------------------------------------------------------------------------------------#
# Step 2 : Merges the training and the test sets to create one data set.              #
#-------------------------------------------------------------------------------------#

merged.data <- rbind(test.rawdata, train.rawdata)


#-------------------------------------------------------------------------------------#
# Step 3. Uses descriptive activity names to name the activities in the data set      #
#-------------------------------------------------------------------------------------#

activity.labels <- read.table("activity_labels.txt")
merged.data[,"Activity"] = activity.labels[merged.data[,"Activity"], 2]



#-------------------------------------------------------------------------------------#
## Step 4: Extracts only the measurements on the mean and standard deviation for each measurement. #
#-------------------------------------------------------------------------------------#

# Step 4a : Get the names of columns with mean and standard deviation.

meanandstd.colnums <- grep("-mean\\(\\)|-std\\(\\)", features.names)


# Step 4b : Extract the data for choosen columns (mean() and std()) as well as activities and subject #

extracted.data <- merged.data[,c(562,563, meanandstd.colnums)]



#-------------------------------------------------------------------------------------#
#  Step 5: Creates a second, independent tidy data set                                #
#    with the average of each variable for each activity and each subject.            #
#-------------------------------------------------------------------------------------#

aftermelt.data <- melt(extracted.data, id.vars=c("Activity","Subject"))
tidy.data <- dcast(aftermelt.data, Activity + Subject ~ variable, mean)

write.table(tidy.data, "TidyData.txt", row.name=FALSE)