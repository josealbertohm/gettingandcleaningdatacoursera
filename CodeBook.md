# CodeBook

The objective of this code book is to describes the variables, the data and the course project requirements to get and clean up the data to have the tidy data.

## The data source

* Data set zip file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Data set description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data set information

The experiments were carried out with 30 volunteers within an age range between 19-48 years. The activities activities performed for each of them were:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

All the activities were done wearing Samsung Galaxy S II smart phone on the waist. Using its accelerometer and gyroscope, were captured 3-axial linear accelerations and 3-axial angular velocities at a constant rate of 50Hz. 

The experiments were video recorded to label the data manually. The data obtained has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The data

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smart phone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


## Course project details

There are 5 requirements for the course project:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## ```run_analysis.R``` detailed implementation:

* Load the two R packages required
  - ```reshape2``` to transform data between wide and long formats
  - ```data.table``` to reading the data set(s) as data frame(s)
* Load the activity data labels
* Load the data column names
* Extract only the mean and standard deviation for each measurement
* Load the X and y test data with its subjects
* Filter mean and standard deviation measurements from the X test data
* Setting up the descriptive activity names
* Bind the X and y test data
* Load the X and y data with its subjects
* Set row names for X test data based in the features
* Extract only the mean and standard deviation for each measurement
* Setting up the row names for train data
* Merge test and train data
* Create labels for the tidy data set with descriptive variable names
* Apply the mean function to dataset using ```dcast``` function
* Write the tidy data set as a text file using ```write.table``` function
