## Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Steps

* Download the compressed datasets from here

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

* Extract to C:\Coursera\Cleaning Data

* The following folders will be created:

* "UCI HAR Dataset", "\UCI HAR Dataset\test", "\UCI HAR Dataset\test\Inertial Signals", "\UCI HAR Dataset\train", "\UCI HAR Dataset\train\Inertial Signals" 

* Run the "run_analysis.R" script

* The script will produce a Tidy Data file (tidy_data.txt) containing Averages (Means) grouped by Subjects and Activities.

* The script will set the proper working directory  ie "C:\Coursera\Cleaning Data\UCI HAR Dataset"

## External Requirements

* Install the "data.table" package   i.e. install.packages("data.table")

## Repository

* README.md

* CodeBook.md

* run_analysis.R

* tidy_data.txt
