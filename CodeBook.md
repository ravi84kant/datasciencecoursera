

The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

1)  Merges the training and the test sets to create one data set

    • X (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
    • Y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
    • Subject (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function
    • Merged_Data (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function

2) Extracts only the measurements on the mean and standard deviation for each measurement

    • Clean_data (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

3) Uses descriptive activity names to name the activities in the data set

    • Entire numbers in code column of the Clean_data replaced with corresponding activity taken from second column of the activities variable

4) Appropriately labels the data set with descriptive variable names

    • code column in TidyData renamed into activities
    • All Acc in column’s name replaced by Accelerometer
    • All Gyro in column’s name replaced by Gyroscope
    • All BodyBody in column’s name replaced by Body
    • All Mag in column’s name replaced by Magnitude
    • All start with character f in column’s name replaced by Frequency
    • All start with character t in column’s name replaced by Time

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

    • Summary_Data (180 rows, 88 columns) is created by sumarizing  Clean_data taking the means of each variable for each activity and each subject, after groupped by subject and activity.
    • Export Summary_Data into Summary_Data.txt file.
