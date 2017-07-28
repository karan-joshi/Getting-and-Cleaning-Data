# Course project for Getting and Cleaning Data course

This is a solution to the course project for Data Science course- Getting and Cleaning Data.


## Project

Given the data files from the data source as explained in code book, create a single tidy data set.

There are 5 steps involved to get the new tidy dataset:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to run this project

The script Run_analysis.R applies all the transformations.

1. Download the data files from the data source as mentioned in the code book.
2. Adjust the directory paths in the R script file according to where you save the data files.
3. Run the R script Run_analysis.R

This script creates a new text file for the tidy dataset in the same directory you are working in.
