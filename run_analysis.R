## Peer-graded Assignment: Getting and Cleaning Data Course Project
## The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
## The goal is to prepare tidy data that can be used for later analysis.

# set the working directory
setwd("./shree/Personal/courses/2018/Cleaning Data/Week4/Data/UCI HAR Dataset/")

## Step 1: Merges the training and the test sets to create one data set.

#read the training dataset (all three files)
train <- read.table(file="./train/X_train.txt", sep="", 
                    strip.white = TRUE, 
                    allowEscapes = TRUE,dec=".")

yactivities <- read.table(file="./train/y_train.txt", header=FALSE, sep="", 
                    strip.white = TRUE, 
                    allowEscapes = TRUE,col.names = c("ActivityID"),stringsAsFactors = TRUE, colClasses = "character")

subjectIds <- read.table(file="./train/subject_train.txt", header=FALSE, sep="", 
                          strip.white = TRUE, 
                          allowEscapes = TRUE,col.names = c("SubjectID"))

#load the dplyr library
library(dplyr)


#replace the activity Ids with their corresponding activity names
yactivitiesIds <- mutate(yactivities, ActivityID = ifelse(ActivityID == "1", "WALKING",as.character(ActivityID)))
yactivitiesIds <- mutate(yactivitiesIds, ActivityID = ifelse(ActivityID == "2", "WALKING_UPSTAIRS",as.character(ActivityID)))
yactivitiesIds <- mutate(yactivitiesIds, ActivityID = ifelse(ActivityID == "3", "WALKING_DOWNSTAIRS",as.character(ActivityID)))
yactivitiesIds <- mutate(yactivitiesIds, ActivityID = ifelse(ActivityID == "4", "SITTING",as.character(ActivityID)))
yactivitiesIds <- mutate(yactivitiesIds, ActivityID = ifelse(ActivityID == "5", "STANDING",as.character(ActivityID)))
yactivitiesIds <- mutate(yactivitiesIds, ActivityID = ifelse(ActivityID == "6", "LAYING", as.character(ActivityID)))       
                                                        

#add the activities to the train dataset as the 1st column
trainset <- cbind(yactivitiesIds,train)

#add the subject Ids to the train dataset as the very 1st column
trainsetall <- cbind(subjectIds,trainset)


# training dataset is now ready.... proceed to read test dataset
Xtest <- read.table(file="./test/X_test.txt", sep="", 
                    strip.white = TRUE, 
                    allowEscapes = TRUE,dec=".")


subjectIds <- read.table(file="./test/subject_test.txt", header=FALSE, sep="", 
                         strip.white = TRUE, 
                         allowEscapes = TRUE,col.names = c("SubjectID"))


ytest <- read.table(file="./test/y_test.txt", header=FALSE, sep="", 
                          strip.white = TRUE, 
                          allowEscapes = TRUE,col.names = c("ActivityID"),stringsAsFactors = TRUE, colClasses = "character")

#replace the activity Ids with their corresponding activity names
yactivitiesIds <- mutate(ytest, ActivityID = ifelse(ActivityID == "1", "WALKING",as.character(ActivityID)))
yactivitiesIds <- mutate(yactivitiesIds, ActivityID = ifelse(ActivityID == "2", "WALKING_UPSTAIRS",as.character(ActivityID)))
yactivitiesIds <- mutate(yactivitiesIds, ActivityID = ifelse(ActivityID == "3", "WALKING_DOWNSTAIRS",as.character(ActivityID)))
yactivitiesIds <- mutate(yactivitiesIds, ActivityID = ifelse(ActivityID == "4", "SITTING",as.character(ActivityID)))
yactivitiesIds <- mutate(yactivitiesIds, ActivityID = ifelse(ActivityID == "5", "STANDING",as.character(ActivityID)))
yactivitiesIds <- mutate(yactivitiesIds, ActivityID = ifelse(ActivityID == "6", "LAYING", as.character(ActivityID)))       

#add the activities to the test dataset as the 1st column
testset <- cbind(yactivitiesIds,Xtest)

#add the subject Ids to the test dataset as the very 1st column
testsetall <- cbind(subjectIds,testset)

#combine train and test dataset -- Step 1 complete...
onedataset <- rbind(testsetall,trainsetall)

##Step 3 - Uses descriptive activity names to name the activities in the data set
#read all the variable names from features.txt file
varnames <- read.table(file="./features.txt", header=FALSE, sep="", 
                       strip.white = TRUE, 
                       allowEscapes = TRUE,col.names = c("ID", "VariableName"))

#STEP 2 -- Extracts only the measurements on the mean and standard deviation for each measurement. 
meanandstdvars <- filter(varnames, grepl("mean\\(\\)", VariableName) | grepl("std\\(\\)", VariableName))



#Step 4 - Appropriately labels the data set with descriptive variable names. 
#Assign the descriptive column names to the dataset
onedataset <- onedataset %>% rename( ActivityName = ActivityID)
onedatasetDescriptive <- onedataset

for (val in meanandstdvars$ID)
{
  valActual <- val + 2 # this is because 1st two columns are SubjectID and ActivityName hence start from 3rd column
  variName <- filter(meanandstdvars, ID == val)
  colnames(onedatasetDescriptive)[valActual] <- as.character(variName$VariableName)
}


#Ignore other columns that are not needed (i.e. those do not contain mean() and std() )
finaldataset <- select(onedatasetDescriptive, -starts_with("V"))

#make the column names tidy i.e. remove brackets from column names
colnames(finaldataset) <- gsub("\\(","",names(finaldataset))
colnames(finaldataset) <- gsub("\\)","",names(finaldataset))

#remove the - sign from column names
colnames(finaldataset) <- sub("-","",names(finaldataset))

#Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable
  # for each activity and each subject.
tidyset <- finaldataset %>% group_by(SubjectID,ActivityName)
tidyfinaldata <- summarize_all(tidyset,mean)

#write the final tidy data to a file
write.csv(tidyfinaldata, file="./tidyfinaldata.txt",row.names=FALSE)

