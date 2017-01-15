
#importing the relevant libraries_______________________________________--------
library(dplyr)

#importing data from the folders for training and test sets --------------------
xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/Y_train.txt")
sTrain <- read.table("train/subject_train.txt")
xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/Y_test.txt")
sTest <- read.table("test/subject_test.txt")
feat <- read.table("features.txt")
aclab <- read.table("activity_labels.txt")



#setting the column names for the test and the training files obtained from
#features.txt and activity_labels.txt
names(xTest) <- feat[,2]
names(xTrain) <- feat[,2]
names(yTest) <- "activityId"
names(yTrain) <- "activityId"
names(sTest) <- "subjectId"
names(sTrain) <- "subjectId"
names(aclab)<- c("activityId","activityType")


# 1....Merging the training and the test sets to create one dataset "fitness"
train <- cbind(sTrain,yTrain,xTrain)
test <- cbind(sTest,yTest,xTest)
fitness <- rbind(train,test)

# 2....Extracting the measurements on the mean and standard deviation for each measurement.
meanstd <- sapply(names(fitness),function(x) grepl("mean",x)|grepl("std",x))
mean_std_data <- fitness[,meanstd==TRUE]

# 3....Descriptive activity names to name the activities in the data set
fitness2 <- merge(aclab,fitness,by="activityId",all=TRUE)
#View the results to see the changes
View(fitness2)

# 4....label the data set with descriptive variable names
names(fitness2)<-gsub("^t", "time", names(fitness2))
names(fitness2)<-gsub("^f", "frequency", names(fitness2))
names(fitness2)<-gsub("Acc", "Accelerometer", names(fitness2))
names(fitness2)<-gsub("Gyro", "Gyroscope", names(fitness2))
names(fitness2)<-gsub("Mag", "Magnitude", names(fitness2))
names(fitness2)<-gsub("BodyBody", "Body", names(fitness2))


# 5....Creating a second, independent tidy data set with the average of each variable for 
#each activity and each subject and saving the table in a text file.
fitness2 %>% group_by(activityId,activityType,subjectId) %>% summarise_all(mean)%>%
  write.table(file = "tidydata.txt",row.names= FALSE)
#See the data 
viewdata <- read.table("tidydata.txt",header = TRUE)
View(viewdata)

# ------------------------END----------------------------------------

