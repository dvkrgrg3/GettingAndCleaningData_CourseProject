# Getting and Cleaning Data - Course Project

The R script, `run_analysis.R`, does the following:

1. Loads the training and test data sets along with the names of columns
2. Merges the two datasets to create a new dataset
3. Selects the measurements corrsponding to mean and standard deviation
4. Names the activities in the data set according to activityID
5. Labels the data set with appropriate descriptive variable names.
6. Groups the data according to the subject and activity, and creates a second, independent tidy data set
 with the average of each variable for each activity and each subject.
The end result is shown in the file `tidy.txt`.

To run the file follow these steps:
 1. Copy the 'run_analysis.R' in the directory which contains the training and test folders, features.txt
  and activity_labels.txt  
 2. Source the file from there and run it. 
 3. Two outputs will be displayed on the screen: "Fitness" is the merged dataset and "View Data" is the final desired output
 4. The end result is stored in the file `tidy.txt`.
