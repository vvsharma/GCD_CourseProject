#
# Getting and Cleaning Data - COURSE PROJECT
#
# This comment explains the course project requirements and the methodology
# applied in coming up with the solution.
#
# The raw data provided is in multiple files in multiple directory.
# I have extracted the original zip data file into a "data" directory in 
# my course project folder. There are sub-directories train and test created 
# within this data folder which holds the raw traing and testing data. The "data" 
# folder itself has the reference data for the Activities and the Features being 
# measured in the ".txt" files. The raw data files in the train and test folders
# do not have any headers not do they have any linking columns (Ids and Foreign keys)
# in the files. ASSUMPTION: If we go by the instructor's definition of the "Raw" data 
# file, these files have not been manipulated in any way and the data collection 
# has resulted in direct ono-to-one mapping between the rows in the files. This means 
# we can reasonably use the row number as the linking element between the files. 
# That all the files have the same number of rows also points to this being a valid 
# assumption.
# 
# We will use rbind() function to combine the raw data files in each of the test and train 
# folders. We will also use the reference data in the data folder to populate the column names
# for each of the variables. For eg. we will use the Activity-label files for the intermediate
# activity dataset and the "Features.txt" to provide us the header for the measurement data. 
# 
# 
# A single Tidy dataset is our first goal. \
#
# This data set is tidy because:
#       1) All columns represent one and only one variable
#       2) Each row is one and only one observable measurement
#       3) The final combined dataset is the only table for each 
#          of the measurement variables.
#       4) The combined dataset has descriptive column names.
#       5) The Names of the variables should be all 
#               a) lower cases 
#               b) without underscores or dots or white spaces
#               c) not duplicated
#               d) be descriptive 
#       (see Jeff's video on Week 4 - Editing Text Variables slide 16/16)                
#
##################################################################################

##################################################################################
# We are in the "data" directory of the course project.
# Within this directory, we have the test and train directories
# which contain the subject, actvity, measurement data. 
# We will also ignore the inertial_signals folder since it is not 
# mentioned as a requirement and we will have to remove it anyway in step 5.
#
# This parent directory itself contains the reference data for
# the activities (activity_labels.txt) and the names for all the features
# (in the features.txt) which can be used to provide "meaningful names" to
# the measurements in x_test.txt and x_train.txt in their respective directories.
##################################################################################
CourseProjectDataDir<-"~/Google Drive/Data Science/Getting and Cleaning Data/Course Project/UCI HAR Dataset"
oldwd<-getwd()
################################################################
# Create training dataset with Tidy Data principles.
################################################################
setwd(CourseProjectDataDir)
traindir<-"./train"
setwd(traindir)
# Load the "train" subjects and apply a type of "train" to the new variable created called TestOrTrain
trainsubjects<-read.table("subject_train.txt")  # Only the subjects chosen for training
names(trainsubjects)<-"subjectid"

#
# Create Tidy data for activity dataset by loading the reference data and labeling the variables
# We will use activityid to merge the datasets and we can drop it after.
#
rawactivity<-read.table("y_train.txt", header = FALSE, sep = "", dec = ".")
#Apply ActivityId as the column name for the numberic activity data
names(rawactivity)<-"activityid"
#Read the activity labels from the activity_labels.txt file in the parent directory
activitylabel<-read.table("../activity_labels.txt", header = FALSE, sep = "")
#Apply col names as below to this activity master table
names(activitylabel)<-c("activityid", "activityname")
# Apply the labels by merging the activitylabels to the raw activity table.
activity<-merge(rawactivity, activitylabel, by.x="activityid", by.y="activityid")
#drop ActivityId. we dont need the ID variable anymore.
activity<-activity[][2]
#Now we have the activity and "test" subjects, we can c-bind them
traineractivity<-cbind(trainsubjects,activity)
#
# Get the raw training measure data
#
rawdata<-read.table("x_train.txt", header = FALSE, sep = "", dec = ".")
#add meaningful names from the features.txt as colnames for the test data
features<-read.table("../features.txt")
#But before we add this as column names, let us clean it up a bit as mentioned
# in point 5 above on Tidy data. 
# step 1. Change  uppercase to lowercase letters.
# We will do more cleaning to remove non-alphabet chracters after extracting 
# only the mean() and std() data. 
# It is my interpretation that the measures that do not have mean or std 
# followed by the () can be discarded.
# 
features2 <- tolower(features[,2])

#
names(rawdata)<-features2
#Now we have a tidy enough datasets to combine using cbind
trainingsubjectactivityfeaturemeasures <- cbind(traineractivity,rawdata)



################################################################
# Setup "Test" subject data folder as current working directory
################################################################
setwd(CourseProjectDataDir)     # reset to course project data dir
testdir<-"./test"               # and move to test folder from there
setwd(testdir)                  #

# STEP 2 - Prepare the test subject data
# in point 5 above on Tidy data. 
#
# Load the "test" subjects and apply a type value of "test" to the new variable created called TestOrTrain
# in case we need to know who were test and who were training subjects in future
#
testsubjects <-read.table("subject_test.txt", header = FALSE, sep = "")  # Only the subjects chosen for training
#The column of data needs a col name.
names(testsubjects)<-"subjectid"
# set the subject type as "test" if needed in future - NOT NEEDED NOW
# testers$TestOrTrain<-"test"         

rawactivity<-read.table("y_test.txt", header = FALSE, sep = "", dec = ".")
#Apply ActivityId as the column name for the numberic activity data
names(rawactivity)<-"activityid"
#Read the activity labels from the activity_labels.txt file in the parent directory
activitylabel<-read.table("../activity_labels.txt", header = FALSE, sep = "")
#Apply col names as below to this activity master table
names(activitylabel)<-c("activityid", "activityname")
# Apply the labels by merging the activitylabels to the raw activity table.
activity<-merge(rawactivity,activitylabel, by.x="activityid", by.y="activityid")
# Drop the activityid. we don't need it in the Tidy data set.
activity<-activity[][2]
#Now we have the activity and "test" subjects, we can c-bind them
testeractivity<-cbind(testsubjects,activity)
#
#
rawdata<-read.table("x_test.txt", header = FALSE, sep = "", dec = ".")
#add meaningful names from the features.txt as colnames for the test data
features<-read.table("../features.txt")
#But before we add this as column names, let us clean it up a bit as mentioned
# step 1. Change  uppercase to lowercase letters.
# We will do more cleaning to remove non-alphabet chracters after extracting 
# only the mean() and std() data. 
# It is my interpretation that the measures that do not have mean or std 
# followed by the () can be discarded.
# 
features2 <- tolower(features[,2])

#Apply the feature names as Column Names
#
names(rawdata)<-features2

#Now we have a tidy enough datasets to combine using cbind
testingsubjectactivityfeaturemeasures <- cbind(testeractivity,rawdata)


setwd(CourseProjectDataDir) # reset to course project data dir
#
# RBind the training and training data
#
# SAM = SubjectActivityMeasures - is a data set that contains all the training and testing data.
#
SAM<- rbind(trainingsubjectactivityfeaturemeasures,testingsubjectactivityfeaturemeasures)
#
# STEP 3 - Now drop the column variables that are not either "mean()", "meanfreq()" or "std()".
# This eliminates the last 7 angle variables which only use some mean items as parameters 
# among the other variables that not mean or std.
#
# We will use the grep expression grep("((mean|std){1}(freq){0,}[(][)])",SAM)
# to subset only the needed columns 
sam<-SAM[grep("((mean|std){1}(freq){0,}[(][)])",names(SAM))]

