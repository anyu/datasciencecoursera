# Coursera: Getting and Cleaning Data, Week 4 Assignment
# An Yu
# March 6, 2016

library(plyr)
library(dplyr)

# Read in then merge test and training datasets
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
mergedData <- rbind(testData, trainData)

# Extract only mean/standard deviation measurements
features <- read.table("./UCI HAR Dataset/features.txt")
meanstd_data <- intersect(grep("mean|std", features$V2), grep("meanFreq",features$V2,invert=TRUE))

# Capture and clean measurement label 
varNames <- features[meanstd_data,]
varNames$V2 <- gsub("-", ".", varNames$V2)
varNames$V2 <- gsub("\\()", "", varNames$V2)

# Merge extraction with main dataset
subsetData <- mergedData[,meanstd_data]

# Label measurements
names(subsetData) <- varNames$V2

# Read in then merge activity labels and datasets
activityDescrip <- read.table("./UCI HAR Dataset/activity_labels.txt")
testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
mergedActivity <- rbind(testActivity, trainActivity)
cleanLabels <- join(mergedActivity,activityDescrip)

# Label activity column
cleanLabels$V1 <- NULL
names(cleanLabels) <- c("activity")

# Read in then merge subjects datasets
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
mergedSubjects <- rbind(testSubjects, trainSubjects)

# Label subject id column
names(mergedSubjects) <- c("subject_id")

# Create final tidy data table
tidyData <- cbind(cleanLabels,mergedSubjects,subsetData)

# Create independent tidy dataset with activity/subject averages for each measurement
tidyDataSummary <- tidyData %>% group_by(activity,subject_id) %>% summarize_each(funs(mean))
write.table(tidyDataSummary,file="tidyDataSummary.txt",row.name=FALSE)




