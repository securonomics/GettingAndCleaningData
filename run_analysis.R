# Project for Coursera Course "Getting and Cleaning Data"
# Author: Securonomics

# Assume top-level working directory is already set, but that information is in UCI directory
setwd("./UCI HAR Dataset")

# Tried to read the training data, activity and subject and merge; did the same with the
# test dataset, but then got rbind() errors

# Read training and test data and merge
print("Reading in and merging data from main files...")
dataTrain <- read.table("./train/X_train.txt")
dataTest <- read.table("./test/X_test.txt")
dataTT <- rbind(dataTrain, dataTest)

# Read training and test activity labels and merge
print("Reading in and merging data from activity files...")
activityTrain <- read.table("./train/y_train.txt")
activityTest <- read.table("./test/y_test.txt")
activityTT <- rbind(activityTrain, activityTest)

# Read training and test subject labels and merge
print("Reading in and merging data from subject files...")
subjectTrain <- read.table("./train/subject_train.txt")
subjectTest <- read.table("./test/subject_test.txt")
subjectTT <- rbind(subjectTrain, subjectTest)

# Merge the columns into a single dataset
dataTT$subject <- subjectTT$V1
dataTT$activity <- activityTT$V1

### Part 1 COMPLETE: Training and test data sets are merged
print("Part 1 - Created single table from data sets...")
print("Dimensions:")
dim(dataTT)

## Part 2 - Extract only measurements on mean and standard deviation
# First get features and search for those with either "mean" or "std" in the name
# NOTE: I'm excluding "Mean", since those features are not true means
print("Part 2 - Finding mean and standard deviation features...")
features <- read.table("./features.txt")
fMeanSTD <- features[grep("mean|std",features$V2), ]
index <- c(fMeanSTD$V1, which(names(dataTT) %in% c("subject", "activity")))

# Apply the mean/std features vector to the complete data set to get subset
print("Subsetting data table using features...")
data <- dataTT[, index]

### Part 2 COMPLETE: Extracted the mean and standard deviation measurements
print("Part 2 - Completed extracting features")
print("Dimensions:")
dim(data)

## Part 3 - Add descriptive names for the activities in the data set
print("Part 3 - Adding descriptive names for the activity variable")

data$activity[data$activity == 1] <- "Walking"
data$activity[data$activity == 2] <- "WalkingUpstairs"
data$activity[data$activity == 3] <- "WalkingDownstairs"
data$activity[data$activity == 4] <- "Sitting"
data$activity[data$activity == 5] <- "Standing"
data$activity[data$activity == 6] <- "Laying"

### Part 3 COMPLETE: Descriptive names for activities

## Part 4 - Labeling variables with descriptive names taken from feature file
# NOTE: There is likely a better way to do this, but nothing was working, so I went back 
# to the beginning applied the variable names to the large data frame and then subsetted 
# it again.

# labels dataTT with descriptive names, adding the subject and activity names
names(dataTT) <- c(as.character(features$V2), "subject", "activity")
index <- c(fMeanSTD$V1, which(names(dataTT) %in% c("subject", "activity")))

# subset only variables with mean or STD in their names plus subject and activity
data <- dataTT[, index]

# because I'm grabbing data from the merged data set, I've lost the meaningful
# activity variable descriptions, so I'm adding them back in
data$activity[data$activity == 1] <- "Walking"
data$activity[data$activity == 2] <- "WalkingUpstairs"
data$activity[data$activity == 3] <- "WalkingDownstairs"
data$activity[data$activity == 4] <- "Sitting"
data$activity[data$activity == 5] <- "Standing"
data$activity[data$activity == 6] <- "Laying"

# data table "data" is now a 10,299 x 81 element table with descriptive variable names
# save tidy data in file "tidy-data.txt" in directory above the data directory
print("Part 4 - Writing merged and labeled data set to file tidy-dataBIG.txt...")
dataFile <- "../tidy-dataBIG.txt"
write.table(data, dataFile, row.name = FALSE)

### Part 4: COMPLETE - Large tidy data written out to file

## Part 5 - Creating new data table with averages across 79 (81 including id's subject 
## and activity) variables for 30 subjects and 6 activities (180 categorizes)
library(reshape2)
index <- as.character(fMeanSTD[,2])
meltData <- melt(data, id.vars=c("subject","activity"), measure.vars = index)
dataBySubjectActivity <- dcast(meltData, subject + activity ~ variable, mean)

print("Part 5 - Writing re-cast data set to file tidydata.txt...")
dataFile <- "../tidy-data.txt"
write.table(dataBySubjectActivity, dataFile, row.name = FALSE)

print("DONE.")

### Part 5: COMPLETE - Reshaped tidy data written out to file.

