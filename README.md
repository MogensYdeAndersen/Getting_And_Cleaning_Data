1.0 Description of how the "run_analysis.R" script works
########################################################

1.1 Overall description of how the "run_analysis.R" script works
################################################################

1.1 Data source
#################

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Se CodeBook.md for more details.


1.2 Data transformation
#########################

A. Measurement data in 'train/X_train.txt' and 'test/X_test.txt' are merged by using "rbind" into one dataframe.
Then by using "grep" and "subsetting" only columns containing mean measurements and standard deviation measurements
are extracted from the merged data set in the dataframe. This means and standard deviation data set forms the data
records except for two added columns.

B. 'features.txt' is used to give the columns in the dataframe names generally. By using "grep" and "subsetting"
in the above mentioned process, only the relevant mean and standard deviation features are extracted.

C. 'train/Y-train.txt' and 'test/Y-test.txt' are merged into a one data set by using "rbind". This data forms the
one column with human activity data.

D. Data in the 'activity_labels.txt' is used to replace/transform the numbers data into human activity verbs data by
using "merge" in the above mentioned column.

E. 'train/subject_train.txt' and 'test/subject_test.txt' are merged into one data set by using "rbind", and this
data forms one column with human subjects' numbers.

F. The merged mean and standard deviation measurement data is merged with the human activity verbs data column and
the merged human subjects' numbers data column into a pre tidy data dataframe by using "cbind".

G. The column names in the pre tidy data dataframe is filled with appropriate variable names by assigning a vector
that contains "hard coded" colnames for the human activity column and for the human subject number column and a
"grep'ed"" and "subsetted" feature vector".

G. With the "plyr"-package loaded, the final tidy data dataframe is created by taking the mean for each of the
extracted measurements grouped by activity per subject by using ddply.

H. Finally the tidy data set is written into a txt.-file that is stored in the current working directory.



1.3 Detailed description of how the "run_analysis.R" script works
#################################################################

#0. Preconditions
# assumption - the complete data zipfile for this assignment is downloadet and
# all files stored in a UCI HAR Dataset folder under the working directory
#load needed plyr library

library(plyr)

#1. Merge the training data set and the test data set to create one data set

# Load the two measurements data sets
train_Data <- read.table("./UCI HAR Dataset/train/X_train.txt")
test_Data <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Bind the two measurements data sets together row-wise
measure_Data <- rbind(train_Data,test_Data)

#2. Extract mean and standard deviation measurements for each measurement

# Load the feature data that really is the measure_Data'scolnames 
measures <- read.table("./UCI HAR Dataset/features.txt")

# Extract the column numbers that contain "Mean", "mean" and "std" measurements
wanted_Measures <- grep("*Mean*|*mean*|*std*", measures[,2])

# Extract columns that contain mean and standard deviation measurements
mean_std_Data <- measure_Data[,wanted_Measures]

#3. Use descriptive activity names to name activity data

# Load the two activity data sets 
train_Activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
test_Activity <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Bind the two activity data sets together row-wise
all_Activity <- rbind(train_Activity,test_Activity)

# Load the activity label data set
activity_Labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Replace activity data expressed in numbers with activity data expressed by descriptive activity verb
labeled_Activity <- merge(all_Activity,activity_Labels, by.x="V1",by.y="V1", all=TRUE)

# Load the two subject number data sets
train_Subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test_Subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Bind the two subject number data sets together row-wise
all_Subjects <- rbind(train_Subjects,test_Subjects)

# Bind the merged subject number data set together with the merged and renamed activity data set and
# extracted mean and standard deviation data set - with subject numbers in column 1 and activity in column 2
pre_Tidy_Data <- cbind(all_Subjects,labeled_Activity$V2,mean_std_Data)

#4 Label the pre tidy data set with descriptive variable names

colnames(pre_Tidy_Data) <- c("human_Subject","human_Activity",as.vector(measures[,2][wanted_Measures]))

#5 Create a second, independant tidy data set with the average of each variable for each activity and each subject

tidy_Data <- ddply(pre_Tidy_Data, .(human_Subject, human_Activity), function(x) colMeans(x[,3:88]))

# Write the tidy data set into a file without rownames into the working directory
write.table(tidy_Data, file ="./tidy_data.txt", row.name=FALSE)