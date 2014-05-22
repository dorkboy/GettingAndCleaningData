library(data.table)

setwd('C:\\Coursera\\Cleaning Data\\UCI HAR Dataset')

# Read In Data Files
X_train <- read.table(".\\train\\X_train.txt")
y_train <- read.table(".\\train\\y_train.txt")

X_test <- read.table(".\\test\\X_test.txt")
y_test <- read.table(".\\test\\y_test.txt")

subject_train <- read.table(".\\train\\subject_train.txt")
subject_test  <- read.table(".\\test\\subject_test.txt")

features <- read.table("features.txt")
features[, 2] <- gsub("-", "_", tolower(as.character(features[, 2])))

activity_labels <- read.table("activity_labels.txt")

# 1 Merge the training and the test sets to create one data set.
merged_X <- rbind(X_test, X_train)
merged_y <- rbind(y_test, y_train)

merged_subjects <- rbind(subject_test, subject_train)


# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
#
# fixed = TRUE so that we skip over columns like'fBodyAcc-meanFreq()-X', and 'fBodyAcc-meanFreq()-Y'
mean_cols <- grep(pattern='mean()', fixed = TRUE, features[,2])
std_cols <- grep(pattern='std()', features[,2])

reqd_cols <- sort(c(mean_cols, std_cols))

temp <- merged_X[ , reqd_cols]


# 3 Uses descriptive activity names to name the activities in the data set


test <- cbind(merged_subjects, merged_y)
names(test) = c('Subject', 'V1')
activity_desc <- merge(test, activity_labels, by = 'V1')
tds1 <- cbind(activity_desc$Subject, activity_desc$V2, temp)


#4 Appropriately labels the data set with descriptive activity names
# remove ()
col_names <- c('Subject', 'Activity', gsub("\\(|\\)", "", features[reqd_cols, 2]))

names(tds1) <- col_names


#5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# http://stackoverflow.com/questions/20459519/apply-function-on-a-subset-of-columns-sdcols-whilst-applying-a-different-func

sd.cols <- c(3:68)
grp <- c('Subject', 'Activity')

temp1 <- data.table(tds1)
tds_temp <- temp1[, lapply(.SD, mean), by = grp, .SDcols = sd.cols]

# Final Sort
tds2 <- tds_temp[order(Subject, Activity),]

write.table(tds2, "tidy_data.txt")