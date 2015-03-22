library(plyr)

#1. Merge the training data set and the test data set to create one data set

train_Data <- read.table("./UCI HAR Dataset/train/X_train.txt")
test_Data <- read.table("./UCI HAR Dataset/test/X_test.txt")
measure_Data <- rbind(train_Data,test_Data)

#2. Extract mean and standard deviation measurements for each measurement

measures <- read.table("./UCI HAR Dataset/features.txt")
wanted_Measures <- grep("*Mean*|*mean*|*std*", measures[,2])
mean_std_Data <- measure_Data[,wanted_Measures]

#3. Use descriptive activity names to name activity data

train_Activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
test_Activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
all_Activity <- rbind(train_Activity,test_Activity)

activity_Labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
labeled_Activity <- merge(all_Activity,activity_Labels, by.x="V1",by.y="V1", all=TRUE)

train_Subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test_Subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
all_Subjects <- rbind(train_Subjects,test_Subjects)

pre_Tidy_Data <- cbind(all_Subjects,labeled_Activity$V2,mean_std_Data)

#4 Label the data set with descriptive variable names

colnames(pre_Tidy_Data) <- c("human_Subject","human_Activity",as.vector(measures[,2][wanted_Measures]))

#5 Create a second, independant tidy data set with the average of each variable for each activity and each subject

tidy_Data <- ddply(pre_Tidy_Data, .(human_Subject, human_Activity), function(x) colMeans(x[,3:88]))
write.table(tidy_Data, file ="./tidy_data.txt", row.name=FALSE)