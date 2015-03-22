1.0 Code Book


1.1 Study Design
################

The raw data was given from a downloadable zip file from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

8 of the raw files from the different folders are used in the script:

'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.
'train/X_train.txt': Training set.
'train/y_train.txt': Training labels.
'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.
'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Following folders including data files were also included, but they are not used in the script:

'train/Inertial Signals'
'test/Inertial Signals'

I assume that the data is detailing data beneath the data within 'train/X-train.txt' and 'test/X_test.txt'.
I was unable to open these files i R Studio. I opened one of these files in Excel, but I was unable to figure
out how to match the columns in these files and the features in the 'features.txt'.


1.2 Variables i tidy_Data.txt file
##################################

The tidy_Data.txt file contains 36 row and 88 columns

Row 2-88 cotain measurement data, while row 1 contains the following 88 variables with variable names:

"human_Subject" (Subjects' ID-number: from 1 to 30)
"human_Activity" (Subject's performed activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
"tBodyAcc-mean()-X" (time-based unit?)
"tBodyAcc-mean()-Y" (time-based unit?)
"tBodyAcc-mean()-Z" (time-based unit?)
"tBodyAcc-std()-X" (time-based unit?)
"tBodyAcc-std()-Y" (time-based unit?)
"tBodyAcc-std()-Z" (time-based unit?)
"tGravityAcc-mean()-X" (time-based unit?)
"tGravityAcc-mean()-Y" (time-based unit?)
"tGravityAcc-mean()-Z" (time-based unit?)
"tGravityAcc-std()-X" (time-based unit?)
"tGravityAcc-std()-Y" (time-based unit?)
"tGravityAcc-std()-Z" (time-based unit?)
"tBodyAccJerk-mean()-X" (time-based unit?)
"tBodyAccJerk-mean()-Y" (time-based unit?)
"tBodyAccJerk-mean()-Z" (time-based unit?)
"tBodyAccJerk-std()-X" (time-based unit?)
"tBodyAccJerk-std()-Y" (time-based unit?)
"tBodyAccJerk-std()-Z" (time-based unit?)
"tBodyGyro-mean()-X" (time-based unit?)
"tBodyGyro-mean()-Y" (time-based unit?)
"tBodyGyro-mean()-Z" (time-based unit?)
"tBodyGyro-std()-X" (time-based unit?)
"tBodyGyro-std()-Y" (time-based unit?)
"tBodyGyro-std()-Z" (time-based unit?)
"tBodyGyroJerk-mean()-X" (time-based unit?)
"tBodyGyroJerk-mean()-Y" (time-based unit?)
"tBodyGyroJerk-mean()-Z" (time-based unit?)
"tBodyGyroJerk-std()-X" (time-based unit?)
"tBodyGyroJerk-std()-Y" (time-based unit?)
"tBodyGyroJerk-std()-Z" (time-based unit?)
"tBodyAccMag-mean()" (time-based unit?)
"tBodyAccMag-std()" (time-based unit?)
"tGravityAccMag-mean()" (time-based unit?)
"tGravityAccMag-std()" (time-based unit?)
"tBodyAccJerkMag-mean()" (time-based unit?)
"tBodyAccJerkMag-std()" (time-based unit?)
"tBodyGyroMag-mean()" (time-based unit?)
"tBodyGyroMag-std()" (time-based unit?)
"tBodyGyroJerkMag-mean()" (time-based unit?)
"tBodyGyroJerkMag-std()" (time-based unit?)
"fBodyAcc-mean()-X" (frequency domain signals-based unit?)
"fBodyAcc-mean()-Y" (frequency domain signals-based unit?)
"fBodyAcc-mean()-Z" (frequency domain signals-based unit?)
"fBodyAcc-std()-X" (frequency domain signals-based unit?)
"fBodyAcc-std()-Y" (frequency domain signals-based unit?)
"fBodyAcc-std()-Z" (frequency domain signals-based unit?)
"fBodyAcc-meanFreq()-X" (frequency domain signals-based unit?)
"fBodyAcc-meanFreq()-Y" (frequency domain signals-based unit?)
"fBodyAcc-meanFreq()-Z" (frequency domain signals-based unit?)
"fBodyAccJerk-mean()-X" (frequency domain signals-based unit?)
"fBodyAccJerk-mean()-Y" (frequency domain signals-based unit?)
"fBodyAccJerk-mean()-Z" (frequency domain signals-based unit?)
"fBodyAccJerk-std()-X" (frequency domain signals-based unit?)
"fBodyAccJerk-std()-Y" (frequency domain signals-based unit?)
"fBodyAccJerk-std()-Z" (frequency domain signals-based unit?)
"fBodyAccJerk-meanFreq()-X" (frequency domain signals-based unit?)
"fBodyAccJerk-meanFreq()-Y" (frequency domain signals-based unit?)
"fBodyAccJerk-meanFreq()-Z" (frequency domain signals-based unit?)
"fBodyGyro-mean()-X" (frequency domain signals-based unit?)
"fBodyGyro-mean()-Y" (frequency domain signals-based unit?)
"fBodyGyro-mean()-Z" (frequency domain signals-based unit?)
"fBodyGyro-std()-X" (frequency domain signals-based unit?)
"fBodyGyro-std()-Y" (frequency domain signals-based unit?)
"fBodyGyro-std()-Z" (frequency domain signals-based unit?)
"fBodyGyro-meanFreq()-X" (frequency domain signals-based unit?)
"fBodyGyro-meanFreq()-Y" (frequency domain signals-based unit?)
"fBodyGyro-meanFreq()-Z" (frequency domain signals-based unit?)
"fBodyAccMag-mean()" (frequency domain signals-based unit?)
"fBodyAccMag-std()" (frequency domain signals-based unit?)
"fBodyAccMag-meanFreq()" (frequency domain signals-based unit?)
"fBodyBodyAccJerkMag-mean()" (frequency domain signals-based unit?)
"fBodyBodyAccJerkMag-std()" (frequency domain signals-based unit?)
"fBodyBodyAccJerkMag-meanFreq()" (frequency domain signals-based unit?)
"fBodyBodyGyroMag-mean()" (frequency domain signals-based unit?)
"fBodyBodyGyroMag-std()" (frequency domain signals-based unit?)
"fBodyBodyGyroMag-meanFreq()" (frequency domain signals-based unit?)
"fBodyBodyGyroJerkMag-mean()" (frequency domain signals-based unit?)
"fBodyBodyGyroJerkMag-std()" (frequency domain signals-based unit?)
"fBodyBodyGyroJerkMag-meanFreq()" (frequency domain signals-based unit?)
"angle(tBodyAccMean,gravity)" (radians/second-based unit?)
"angle(tBodyAccJerkMean),gravityMean)" (radians/second-based unit?)
"angle(tBodyGyroMean,gravityMean)" (radians/second-based unit?)
"angle(tBodyGyroJerkMean,gravityMean)" (radians/second-based unit?)
"angle(X,gravityMean)" (radians/second-based unit?)
"angle(Y,gravityMean)" (radians/second-based unit?)
"angle(Z,gravityMean)" (radians/second-based unit?)


