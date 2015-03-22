# README - Project for Coursera Course "Getting and Cleaning Data"
### Author: Securonomics

This is the file that explains my submission for the Week 3 project of the Coursera course, "Getting and Cleaning Data."

## Components
There are four components to this submission.

### 1. run_analysis.R
This is R script that will generate two (2) tidy data files. The first generated file, `tidy-dataBIG.txt`, contains a large data table of dimensions 10,299 x 81 that is the result of the first 4 steps of the project. The second file, `tidy-data.txt`, is the smaller summary table that has the means across the 79 variables for the 180 combinations of 30 subjects and 6 activities. 

To generate the tidy data files, run the following statement in R from the working directory containing the _UCI HAR Dataset_ folder:
`source('run_analysis.R')`

### 2. Tidy Data files
I've only included one -- `tidy-data.txt` -- but my script also saves the intermediate file from Step 4 in `tidy-dataBIG.txt`.

### 3. Code book
The code book has a listing of the variables in the final tidy data file, which also matches those in the larger files, except that the summary is takes the mean of the dozens of measurements for each variable per subject and activity.

### 4. README.md
This file explaining the answers to the assigment.

## Walkthrough of `run_analysis.R` script
The script is designed to be run from the working director that _contains_ the _UCI HAR Dataset_ folder. 

### Part 1 - Merging the training and test sets
Assume top-level working directory is already set, but that the desired data has been decompressed in the UCI directory. 

I initially tried to read in and then immediately merge the accelerometer data, activity data and subject data for the training set, and then the test set, before merging the two larger data sets, but I encountered errors. Instead, I read in the training and testing data for each category (measurements, activity and subjects) and merged those, before combining the activity and subject columns onto the main data set.

This produced a data table with 10,299 rows and 563 columns.

### Part 2 - Extract measurements on mean and standard deviation
For this part, after looking at the data, I defined measurements on mean and standard deviation as those variables which have "mean" or "std" in their name. I excluded variables the "Mean" in their name as something that was not a mean value, but some other measurement. 

This resulted in a data table that had 10,299 rows and 81 columns.

### Part 3 - Add descriptive names for the activities
Using the description of the activities in the `activity_labels.txt` file, I assigned descriptive names for each of the six activities into the "activity" variable of the table:
1. Walking
2. WalkingUpstairs
3. WalkingDownstairs
4. Sitting
5. Standing
6. Laying

This resulted in a data table that had 10,299 rows and 81 columns, with descriptive terms in the "activity" column.

### Part 4 - Labeling variables with descriptive names
In this part, I used the variable names from the `features.txt` file to replace the column names in the data table. 

I had trouble completing the operation on the reduced data table -- the one with 81 columns -- so I did it to the original merged table with 563 columns, then reduced it using my previous steps. There is likely a better way to do this, but nothing was working. I justify this in that, in a real-world situation, I would re-organize my steps rather than follow the exact sequence specified in the assignment.

At the end, I wrote out the data without row names to the file `tidy-dataBIG.txt`. 

This step results in a file, tidy-dataBIG.txt, that has 10,299 rows and 81 variables (including the subject and activity variables). The columns have meaningful names and the activity varialble has descriptive values.

### Part 5 - Creating new data table with average values
For the final calculation, I used melting and recasting to product 180 vectors of measurements -- one for each of the 30 subjects and each of the 6 activities. Each vector consisted of the subject, activity and means of each of the 79 variables. 

When done, the data was written out to a file `tidy-data.txt`.

The step results in a recast table with 180 rows and 81 columns, where each row is a vector of the calculated means for the 79 variables for each subject and activity.