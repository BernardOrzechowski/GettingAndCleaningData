run_analysis <- function() {
      ## Function reads (from local copy) the dataset found
      ## on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
      ## and perfoms some operations on it to produce a tidy set with 
      ##  the average of each mean() and std() variable for each activity and each subject. 
      ## Script steps:
      ## 1. Merges the training and the test sets to create one data set.
      ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
      ## 3. Uses descriptive activity names to name the activities in the data set
      ## 4. Appropriately labels the data set with descriptive activity names. 
      ## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
      
      ##EXAMPLE USAGE
      ## library(xlsx)
      ## data <- run_analysis()
      ## write.xlsx(data$aggregated_measures, "aggregated_measures.xlsx", col.names = TRUE, row.names = FALSE,showNA=FALSE)
      
      
#load the activity labels
# needed for TASK 3 Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt", col.names=c("activity_id","activity_label"),  stringsAsFactors=FALSE)

# load the features, do not convert the second columns to a factor
features <- read.table("features.txt", col.names=c("feature_id","feature_name"),  stringsAsFactors=FALSE)
# filter onyl the std() and mean()  measures
features <- features[ features$feature_id %in% grep("mean\\(\\)|std\\(\\)",features$feature_name, value = FALSE), ]

## Load and merge the subject ids
#load the test subject ids
subject_test_ids <- read.table("subject_test.txt", col.names=c("subject_id"))
#load the train subject ids
subject_train_ids <- read.table("subject_train.txt", col.names=c("subject_id"))
#merge the subjects ids (i-th entry corresponds to i-th observation)
subject_ids <- append (subject_test_ids$subject_id, subject_train_ids$subject_id)

## Load and merge the activity label ids
#load the test activity label ids
activity_test_ids <- read.table("y_test.txt", col.names=c("activity_id"))
#load the train activity label ids
activity_train_ids <- read.table("y_train.txt", col.names=c("activity_id"))
#merge the activity label ids (i-th entry corresponds to i-th observation)
activity_ids <- rbind (activity_test_ids, activity_train_ids)

## Load,merge amd filter the data only to mean and standard deviation 
#load the test measurements
measurements_test <- read.table("x_test.txt")
#leave only columns *mean()* and *std()* 
#TASK 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
measurements_test <- measurements_test[features$feature_id]
#set the column names in the dataframe
colnames(measurements_test) <- features$feature_name

#load the train measurements
measurements_train <- read.table("x_train.txt")
#leave only columns *mean()* and *std()* 
#TASK 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
measurements_train <- measurements_train[features$feature_id]
#set the column names in the dataframe
colnames(measurements_train) <- features$feature_name

#merge the measurements (i-th entry corresponds to i-th observation)
measurements <- rbind (measurements_test, measurements_train) 
#add to measurements informaiotn about subject (first column)
measurements <- cbind (subject_ids, measurements)
#add to measurements informaiotn about activity 
#TASK 1 (finalized) Merges the training and the test sets to create one data set.
#TASK 3 (finalized) Uses descriptive activity names to name the activities in the data set
measurements <- cbind (merge(activity_ids, activity_labels)[,"activity_label"], measurements,  stringsAsFactors=FALSE)
colnames(measurements)[1] <- "activity"
#rename the subject column
#TASK 4 (finalized) Appropriately labels the data set with descriptive activity names. 
colnames(measurements)[2] <- "subject"

all_subjects_and_activities <- merge(unique(subject_ids),unique(activity_labels))
colnames(all_subjects_and_activities)[1] <- "subject"
colnames(all_subjects_and_activities)[3] <- "activity"
#only the need columns for the join are taken
all_subjects_and_activities <- subset( all_subjects_and_activities, select = c("activity", "subject") )
#fill the missing combinations
measurements_for_aggregation <- merge(all_subjects_and_activities,measurements, all.x = TRUE, all.y=FALSE  )
#calculate the averages for each varaible for each activity and each subject
aggregated_measures <- aggregate(. ~ activity + subject, data = measurements_for_aggregation, FUN = mean, na.action=na.pass)
#retunr 2 data sets (measurements -> basic beasurements, aggregated_measures -> tidy data set with the mean values for the specified variables)
list(measurements = measurements, aggregated_measures = aggregated_measures)
}
