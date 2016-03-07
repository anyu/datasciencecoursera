==================================================================
Coursera: Getting and Cleaning Data, final assignment 
March 6, 2016
An Yu
==================================================================

Description:

This repository contains my submission for Coursera's Getting and Cleaning Data course.

The purpose of this assignment was to demonstrate our ability to collect, work with, and clean a real data set. 
The input data was taken from UC Irvine's [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) study and can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==================================================================

Repository Contents:

1. README.md
2. CodeBook.md
3. run_analysis.R
4. tidyDataSummary.txt

==================================================================

Assignment Instructions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

==================================================================

Script Description (run_analysis.R):

This script combines the test and training datasets, extracts the mean and standard deviation measurements, and cleans up the datasets by matching the appropriate experiment activities and subject IDs. It outputs the second tidy data set to the "tidyDataSummary.txt" file.


==================================================================

Requirements:

The libraries 'dplyr' and 'plyr' need to be installed.

==================================================================

Running the script (script needs to be in the same directory as the dataset):

source("run_analysis.R")
