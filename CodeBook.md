# Code Book - Tidy Data Project
## Coursera "Getting and Cleaning Data" course, March 22, 2015
## by Securonomics

## Subject
The ID of the subject participating in the experiment, as a number between 1 and 30.

[int] 1 .. 30

## Activity
A label representing the type of activity the subject was doing at the time of measurement. Original experiment labeled the data as [int] 1 .. 6.

"Walking" 						(1 in original data)
"WalkingUpstairs"			(2 in original data)
"WalkingDownstairs"		(3 in original data)
"Sitting"							(4 in original data)
"Standing"						(5 in original data)
"Laying"							(6 in original data)

## Mean and Standard Deviation Accelerometer Data
These 79 values are from the "Human Activity Recognition Using Smartphones Dataset - Version 1.0" used as part of the course.

The data comes from experiments of 30 volunteers who performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) while wearing a smartphone (Samsung Galazy S II) on their waist. The experiments used the embedded 3-axial linear accelerometer and gyroscope to capture 561 data points at a 50Hz sample rate. The resulting data was divided into a training set (encompassing 70 percent of the data) and a test set (the other 30 percent). More information can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data set used in the project consist of only those 79 variables having to do with the mean and standard deviation of the accelerometer measurements. 

They are as follows:

[1] "tBodyAcc-mean()-X"            "tBodyAcc-mean()-Y"              
[3] "tBodyAcc-mean()-Z"            "tBodyAcc-std()-X"               
[5] "tBodyAcc-std()-Y"             "tBodyAcc-std()-Z"               
[7] "tGravityAcc-mean()-X"         "tGravityAcc-mean()-Y"           
[9] "tGravityAcc-mean()-Z"         "tGravityAcc-std()-X"            
[11] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"            
[13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"          
[15] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"           
[17] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"           
[19] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"             
[21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"              
[23] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"              
[25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"         
[27] "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"          
[29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"          
[31] "tBodyAccMag-mean()"          "tBodyAccMag-std()"              
[33] "tGravityAccMag-mean()"       "tGravityAccMag-std()"           
[35] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"          
[37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"             
[39] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"         
[41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"              
[43] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"               
[45] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"               
[47] "fBodyAcc-meanFreq()-X"       "fBodyAcc-meanFreq()-Y"          
[49] "fBodyAcc-meanFreq()-Z"       "fBodyAccJerk-mean()-X"          
[51] "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"          
[53] "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"           
[55] "fBodyAccJerk-std()-Z"        "fBodyAccJerk-meanFreq()-X"      
[57] "fBodyAccJerk-meanFreq()-Y"   "fBodyAccJerk-meanFreq()-Z"      
[59] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"             
[61] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"              
[63] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"              
[65] "fBodyGyro-meanFreq()-X"      "fBodyGyro-meanFreq()-Y"         
[67] "fBodyGyro-meanFreq()-Z"      "fBodyAccMag-mean()"             
[69] "fBodyAccMag-std()"           "fBodyAccMag-meanFreq()"         
[71] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"      
[73] "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"        
[75] "fBodyBodyGyroMag-std()"      "fBodyBodyGyroMag-meanFreq()"    
[77] "fBodyBodyGyroJerkMag-mean()"  "fBodyBodyGyroJerkMag-std()"     
[79] "fBodyBodyGyroJerkMag-meanFreq()"
