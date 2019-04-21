# 1) Merges the training and the test sets to create one data set.

A <- rbind(x_train, x_test)
B <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_data <- cbind(Subject, A, B)

# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
Clean_data <- Merged_data %>% select(subject, code, contains("mean"), contains("std"))

# 3) Uses descriptive activity names to name the activities in the data set.
Clean_data$code <- activities[Clean_data$code, 2]

# 4) Appropriately labels the data set with descriptive variable names.
names(Clean_data)[2] = "activity"
names(Clean_data)<-gsub("Acc", "Accelerometer", names(Clean_data))
names(Clean_data)<-gsub("Gyro", "Gyroscope", names(Clean_data))
names(Clean_data)<-gsub("BodyBody", "Body", names(Clean_data))
names(Clean_data)<-gsub("Mag", "Magnitude", names(Clean_data))
names(Clean_data)<-gsub("^t", "Time", names(Clean_data))
names(Clean_data)<-gsub("^f", "Frequency", names(Clean_data))
names(Clean_data)<-gsub("tBody", "TimeBody", names(Clean_data))
names(Clean_data)<-gsub("-mean()", "Mean", names(Clean_data), ignore.case = TRUE)
names(Clean_data)<-gsub("-std()", "STD", names(Clean_data), ignore.case = TRUE)
names(Clean_data)<-gsub("-freq()", "Frequency", names(Clean_data), ignore.case = TRUE)
names(Clean_data)<-gsub("angle", "Angle", names(Clean_data))
names(Clean_data)<-gsub("gravity", "Gravity", names(Clean_data))

# 5) From the data set in step 4, creates a second, 
#    independent tidy data set with the average of 
#    each variable for each activity and each subject.

Summary_Data <- Clean_data %>%
  group_by(subject, activity) %>%
  summarize_all(funs(mean))
write.table(Summary_Data, "Summary_Data.txt", row.names = FALSE)
