
#Install Required Packages
install.packages("data.table")
install.packages("reshape2")

#Load the required packages
library(data.table)
library(reshape2)

###Step-1: Merge the training and test sets to create one data set

#Set the path to the location of test data sets
setwd("/Data Science Course/C3 W4 Dataset/UCI HAR Dataset/test")

#Read the files in the directory into data frames
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

#Set path to location of train data sets
setwd("/Data Science Course/C3 W4 Dataset/UCI HAR Dataset/train")

#Read the files into data frames
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

#Give name to subject column in both test and train set
names(subject_test) <- "subject"
names(subject_train)<- "subject"

#Set path to the location of other required files
setwd("/Data Science Course/C3 W4 Dataset/UCI HAR Dataset")

#Store the feature names file into data frame
feature_names <- read.table("features.txt")

#Use feature names as column names for test and train data sets
names(X_train) <- feature_names$V2
names(X_test) <- feature_names$V2

#Give column name for y labels
names(y_train) <- "activity"
names(y_test) <- "activity"

#Combine the test and train sets with subject and label columns
train_set <- cbind(subject_train, y_train, X_train)
test_set <- cbind(subject_test, y_test, X_test)
full_set <- rbind(train_set, test_set)

###Step-2: Extract only the measurements on the mean and standard deviation for each measurement

#Determine the mean and standard deviation features
extracted_features <- grepl("mean|std", names(full_set))

#Keep the subject and activity columns 
extracted_features[c(1,2)] <- TRUE

#Extract the dataset with only required columns
extracted_set <- full_set[, extracted_features]

###Step-3: Use descriptive activity names to name the activities in data set
###Step-4: Appropriately label the data set with descriptive variable names

#Store the activity names in data frame
activity_labels <- read.table("activity_labels.txt")

#Replace activity ids with the activity descriptions
extracted_set$activity <- factor(extracted_set$activity, levels = activity_labels$V1, labels <- activity_labels$V2)

###Step-5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

#Create the tidy set by melting and applying mean fucntion using dcast
melt_set <- melt(extracted_set, id= c("subject","activity"), measure.vars= setdiff(names(extracted_set),c("subject","activity")))
tidy_set <- dcast(melt_set, subject + activity ~ variable, mean)

#Write the resulting dataset to a txt file
write.table(tidy_set, "tidy_set.txt", row.names=FALSE)




