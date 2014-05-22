## Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Process For Recording Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Steps To Run The Analysis

* Download the compressed datasets from here

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

* Extract to C:\Coursera\Cleaning Data

* Install the "data.table" package   i.e. install.packages("data.table")

* Run the "run_analysis.R" script

## External Requirements

* Install the "data.table" package   i.e. install.packages("data.table")

## Files Used in the Analysis  (see the README.txt file in the working directory)

* X_test.txt  - Test set (561 Measurements for each row)

* X_train.txt - Training set (561 Measurements for each row)

* y_test  - Activity Test IDs (One col - ActivityID)

* y_train - Activity Train IDs (One col - ActivityID)

* subject_test.txt  - Test Subject IDs (One col - SubjectID)

* subject_train.txt - Train Subject IDs (One col - SubjectID)

* activity_labels.txt - A text file that maps the Activity IDs from y_test and y_train above (Two col - ID and Description)

  * 1 WALKING   
  * 2 WALKING_UPSTAIRS    
  * 3 WALKING_DOWNSTAIRS   
  * 4 SITTING   
  * 5 STANDING  
  * 6 LAYING

* features.txt - a list of the 561 Measurements recorded (Two col - ID and Description)

* NOTE:  Files used in the "Inertial Signals" folder are NOT used in this Analysis

## Output

* The script will produce a Tidy Data file (tidy_data.txt) containing Averages (Means) grouped by **Subjects and Activities** for the below 66 variables.

* The Tidy data file is a 180 row (#30 Subjects * 6 Activities per Subject) by 68 (SubjectID, Activity, plus the 66 Variables identified below) column file.

## Design And Implementation

* The script will:

  * merge test (X_test.txt) and training (X_train.txt) data files from the /test and /training folders

  * merge Subject IDs for test (subject_test.txt) and training (subject_train.txt) data files from the /test and /training folders

  * merge Activitys for test (y_test.txt) and training (y_train.txt) data files from the /test and /training folders

  * replace hyphens / dashes ("-") with underscores "_" in the features.txt file.

  * will only select Measurement Names with Mean (mean) and Standard Deviation (std) in the name (excluding names like columns like'fBodyAcc-meanFreq()-X', and 'fBodyAcc-meanFreq()-Y')

  * update the ActivityIDs with more descriptive activity names in the data set

  * labels the data set with descriptive activity names (Column Headers)

  * create a second, independent tidy data set with the average of each variable for **each activity and each subject**.

  * output the tidy data set to a text file ("tidy_data.txt" ) in the working directory

## Variables for which means were calculated (66 Variables)

* tbodyacc_mean_x
* tbodyacc_mean_y
* tbodyacc_mean_z
* tbodyacc_std_x
* tbodyacc_std_y
* tbodyacc_std_z
* tgravityacc_mean_x
* tgravityacc_mean_y
* tgravityacc_mean_z
* tgravityacc_std_x
* tgravityacc_std_y
* tgravityacc_std_z
* tbodyaccjerk_mean_x
* tbodyaccjerk_mean_y
* tbodyaccjerk_mean_z
* tbodyaccjerk_std_x
* tbodyaccjerk_std_y
* tbodyaccjerk_std_z
* tbodygyro_mean_x
* tbodygyro_mean_y
* tbodygyro_mean_z
* tbodygyro_std_x
* tbodygyro_std_y
* tbodygyro_std_z
* tbodygyrojerk_mean_x
* tbodygyrojerk_mean_y
* tbodygyrojerk_mean_z
* tbodygyrojerk_std_x
* tbodygyrojerk_std_y
* tbodygyrojerk_std_z
* tbodyaccmag_mean
* tbodyaccmag_std
* tgravityaccmag_mean
* tgravityaccmag_std
* tbodyaccjerkmag_mean
* tbodyaccjerkmag_std
* tbodygyromag_mean
* tbodygyromag_std
* tbodygyrojerkmag_mean
* tbodygyrojerkmag_std
* fbodyacc_mean_x
* fbodyacc_mean_y
* fbodyacc_mean_z
* fbodyacc_std_x
* fbodyacc_std_y
* fbodyacc_std_z
* fbodyaccjerk_mean_x
* fbodyaccjerk_mean_y
* fbodyaccjerk_mean_z
* fbodyaccjerk_std_x
* fbodyaccjerk_std_y
* fbodyaccjerk_std_z
* fbodygyro_mean_x
* fbodygyro_mean_y
* fbodygyro_mean_z
* fbodygyro_std_x
* fbodygyro_std_y
* fbodygyro_std_z
* fbodyaccmag_mean
* fbodyaccmag_std
* fbodybodyaccjerkmag_mean
* fbodybodyaccjerkmag_std
* fbodybodygyromag_mean
* fbodybodygyromag_std
* fbodybodygyrojerkmag_mean
* fbodybodygyrojerkmag_std