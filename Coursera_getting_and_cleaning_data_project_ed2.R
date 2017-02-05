## This program is for the final project assignment of the getting and cleaning data course
## Setting the wd, loading some of the packages and reading and assigning to variables the train and test files

setwd ('C:/Users/Pablo/Documents/Coursera/Data Science Specialization John Hopkings/Getting and Cleaning Data/Project/UCI HAR Dataset')
library(plyr)
library(data.table)
train_subject = read.table('./train/subject_train.txt',header=FALSE)
train_x = read.table('./train/x_train.txt',header=FALSE)
train_y = read.table('./train/y_train.txt',header=FALSE)
test_subject = read.table('./test/subject_test.txt',header=FALSE)
test_x = read.table('./test/x_test.txt',header=FALSE)
test_y = read.table('./test/y_test.txt',header=FALSE)

## 1)Routine to merge the training and the test sets to create one data set

data_x <- rbind(train_x, test_x)
data_y <- rbind(train_y, test_y)
set_subject <- rbind(train_subject, test_subject)
dim(data_x)
dim(data_y)
dim(set_subject)

## 2)Routine to extract only the measurements on the mean and standard deviation for each measurement.

index_mean_std<- grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])
subset_mean_std<-data_x[,index_mean_std]
index_features_names<- grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])
names(subset_mean_std) <- read.table("features.txt")[index_features_names, 2] 
View(subset_mean_std)
dim(subset_mean_std)

##  3)Routine to use descriptive activity names to name the activities in the data set.

data_y[, 1] <- read.table("activity_labels.txt")[data_y[, 1], 2]
names(data_y)<-"Activities"
View(data_y)

## 4) Routine to appropriately labels the data set with descriptive variable names.
## Also to create a sole, final and clean data set, giving proper naming format to variables

## Routing to create a single data set
names(set_subject)<-"Subject"
View(set_subject)
final_set <- cbind(subset_mean_std, data_y, set_subject)

# Routine to give the proper naming format

names(final_set) <- make.names(names(final_set))
names(final_set) <- gsub('Acc',"Acceleration",names(final_set))
names(final_set) <- gsub('GyroJerk',"AngularAcceleration",names(final_set))
names(final_set) <- gsub('Gyro',"AngularSpeed",names(final_set))
names(final_set) <- gsub('Mag',"Magnitude",names(final_set))
names(final_set) <- gsub('^t',"TimeDomain.",names(final_set))
names(final_set) <- gsub('^f',"FrequencyDomain.",names(final_set))
names(final_set) <- gsub('\\.mean',".Mean",names(final_set))
names(final_set) <- gsub('\\.std',".StandardDeviation",names(final_set))
names(final_set) <- gsub('Freq\\.',"Frequency.",names(final_set))
names(final_set) <- gsub('Freq$',"Frequency",names(final_set))
View (final_set)
write.csv(final_set, file = "final_set.csv")

## 5) From the data set in step 4 this routine creates a second, independent tidy data set with the average of each variable for each activity and each subject.

final_set_averages<-aggregate(. ~Subject + Activities, data=final_set, FUN=mean)
final_set_averages<-final_set_averages[order(final_set_averages$Subject,final_set_averages$Activities),]
View (final_set_averages)
write.csv(final_set_averages, file = "final_set_averages.csv")

## End