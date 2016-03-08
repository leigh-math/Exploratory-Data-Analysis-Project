### Getting and Cleaning Data - Course Project
### Leigh Matthews

#####################################################################



# Getting and Cleaning Data Course Project
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis. 
# You will be required to submit: 
# 	1) a tidy data set as described below, 
# 	2) a link to a Github repository with your script for performing the analysis, and 
# 	3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
# You should also include a README.md in the repo with your scripts. 
# This repo explains how all of the scripts work and how they are connected.


# One of the most exciting areas in all of data science right now is wearable computing. 
# Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
# The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
# A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#####################################################################



## Load packages
library(reshape2)

setwd("~/Exploratory Data Analysis")


# Download the data and extract files.
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Set Working Directory to where the files were downloaded.
setwd("C:/Users/20292/Desktop/Getting_and_cleaning_data/UCI HAR Dataset")



## 1. Read in the .txt data files and the information about the data.
##    Label the data according to the corresponding files. 


## Read all activities and label the aproppriate columns 
activity_labels <- read.table("./activity_labels.txt",col.names=c("activity_id","activity_name"))

## Read the dataframe's column names from the features file.
features <- read.table("features.txt")
feature_names <-  features[,2]


## Read in the test data and label the columns with features
testdata <- read.table("./test/X_test.txt")
colnames(testdata) <- feature_names


## Load the training data and label the columns with features
traindata <- read.table("./train/X_train.txt")
colnames(traindata) <- feature_names


## Load the IDs for the the test subjects and label columns
test_subject_id <- read.table("./test/subject_test.txt")
colnames(test_subject_id) <- "subject_id"


## Read in the test data activity ID's and label the columns
test_activity_id <- read.table("./test/y_test.txt")
colnames(test_activity_id) <- "activity_id"


## Load the IDs for remaing the test subjects and label the columns
train_subject_id <- read.table("./train/subject_train.txt")
colnames(train_subject_id) <- "subject_id"


## Read in the activity ID's of the training data and label the columns
train_activity_id <- read.table("./train/y_train.txt")
colnames(train_activity_id) <- "activity_id"


## Use CBIND to merge Test Subject IDs with the Test Activity IDs (Create new dataframe). 
test_data <- cbind(test_subject_id , test_activity_id , testdata)


## Use CBIND to merge the Train Subject IDs and Train Activity IDs into new dataframe
train_data <- cbind(train_subject_id , train_activity_id , traindata)


## RBIND (adding in rows) to combine the test data and the train data into one dataframe
all_data <- rbind(train_data,test_data)



### 2. Keep only the columns related to mean() or std() values

mean_col_idx <- grep("mean",names(all_data),ignore.case=TRUE)
mean_col_names <- names(all_data)[mean_col_idx]
std_col_idx <- grep("std",names(all_data),ignore.case=TRUE)
std_col_names <- names(all_data)[std_col_idx]

# All the relevant data
meanstddata <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]


## Merge the Activities data with the mean/std values data so there is one dataframe with descriptive activity names
descrnames <- merge(activity_labels,meanstddata,by.x="activity_id",by.y="activity_id",all=TRUE)

## Melt the dataset with the descriptive activity names for better handling
data_melt <- melt(descrnames,id=c("activity_id","activity_name","subject_id"))



## 3. Cast the melted dataset by the average of each variable for each activity and each subject
mean_data <- dcast(data_melt,activity_id + activity_name + subject_id ~ variable,mean)


## 4. Create the output file.

## Create a file with the new tidy dataset
write.table(mean_data,"./tidy_movement_data.txt")
