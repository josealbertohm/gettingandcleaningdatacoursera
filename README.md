# Getting and Cleaning Data course from Coursera

## Course Project

The purpose of this project is to create a R script called run_analysis.R with the next flow

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project

1. Download the zip file from the link mentioned below in the data source section.
2. Uncompress it and you'll get the ```UCI HAR Dataset``` folder.
3. Put ```run_analysis.R``` in the same folder of ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in RStudio.
4. Run ```source("run_analysis.R")```, then it will generate the output text file ```output_tiny_data.txt``` in the same working directory.

## Dependencies

The R script requires the next libraries

1. ```reshape2``` to transform data between wide and long formats
2. ```data.table``` to reading the data set(s) as data frame(s)

They're validated in the begin of the R script and If they are not installed, the script will install them

## Data source

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

