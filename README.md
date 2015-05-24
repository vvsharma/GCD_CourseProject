# Course Project
## Introduction

Note to testers:

1. You can read the final file from step 5 using 'data<-read.table("TidyData.txt")' and examine them using the many
   functions such as head, str, summary etc. in R. 

2. You can source the run_analysis.R file in your main directory as long as the data directory "UCI HAR Dataset" 
   and its necessary sub-direactories are in it.

###Motivation: 
This project aims at providing an overall practical exposure to getting and cleaning data. To that end, the objectives of the project are to read in data collected from 30 subjects performing activities which are monitored and measured using the accelerometer and gyroscope readings in a Samsung smart phone worn at the waist of the subject. This has resulted in data being collected for over 561 features during each of the activity being performed by the subject. This data is dirty in the sense that it cannot be processed without putting it in some sort of order using well defined methods and principles that allows some level of automatic processing using the R scripting language.

###Environment:
The data is extracted into the "Course Project" folder where a new data directory called "UCI HAR Dataset" is created. Within the data directory are files explaing the data, its acquisition and the significance related to other files in the directory. There are 2 reference files containing the activity names and the feature names which provide us the reference data to use as labels. 

This directory also contains 2 sub-directories called "train" and "test". These hold the raw data for subjects measured either during training or being measured as a control group. The data files in this directory have the same names and hold the subject, activity and the measurement data for each of the features.  

###Objectives:
The course project requirement is to create a run_analysis.R script that accomplishes the following objectives.
 
        1. Merges the training and the test sets to create one data set.
        2. Extracts only the measurements on the mean and standard deviation for each feature. 
        3. Uses descriptive activity names to name the activities in the data set
        4. Appropriately labels the data set with descriptive variable names. 
        5. From the data set in step 4, creates a second, independent tidy data set with the 
           average of each variable for each activity and each subject.

###Deliverables: 
        The output from the last step of the objectives is a long form Tidy Data set as per 
        the principles detailed in the week 1 videos by the instructor resulting from the 
        various processing by the run_analysis script. The other objectives indicate the 
        process by which we achieve this (e.g. combining the test and train datasets) as well 
        as providing appropriate variable names as per naming standards mentioned by the 
        instructor in the course videos. This is explained in the methodology section below.
        
##Methdology        
        Note: Although the objectives are numbered above, it is counterproductive to execute 
        them in the same order. Applying all the labels from the reference table first obviates 
        any need of complicated processing later on.

        Using the relational database normalization principles allows us to understand the 
        realationships between the various data sets given to us. The SUBJECTS are either 
        'test' or 'train' subjects who are peforming one of the 7 ACTIVITIES which are tracked 
        as FEATUERES and their MEASUREMENTS. In other words, in a relational database modeling 
        exercise, we would model them as tables and relationships resulting in a final 
        intersecting table that captures the data by each Subject, Activity and Feature Measure. 
        This is our final combined dataset SAM, short for SubjectActivityMeasure.

### Process:
        Each of the training and test data are processed (tagged with the labels and tidied) 
        seperately to combine the Subject, Activity, Feature and the Measurements using the 
        cbind. It is also important to eliminate all but the mean and std measures before the 
        final step. 
        
        *STEPS*
        * For each of the train and test data the following steps are performed separately.
                
                1. The subjects are read in from the "subject_train.txt" or the 
                   "subject_test.txt". 
        
                2. We assign a label of "subjectid" to the subject ids column.
        
                3. The activities (from y_train.txt or y_test.txt ) and the activity labels 
                   from "../activity_labels" files are "merge"ed on the activity id. 
                
                4. The activity id column is eliminated and "activityname" is assigned as 
                   the name for the activity. 
                
                5. The subject and the activity tables are now combined using "cbind"" with 
                   the resulting table having subjectid and activityname as columns.
                
                6. The features masurement data is loaded from the "x_train.txt"" or 
                   "x_test.txt" file.
                
                7. The labels for the feature set is loaded from the features.txt file and 
                   converted to lowercase.
                
                8. The feature lables (some 561 of them) are applied to the feature measurement 
                   data.  
                
                9. The feature columns that are not either "mean" or "std" are eliminated using 
                   grep. 
                
                10.The column names are cleaned up of - and () charactes using gsub.
                
                11.Finally the Subject Activity table from the above step 5 is combined with the 
                   feature data using "cbind".
                   
        * The test and train data are now combined together using the "rbind" as required 
          by objective #1.
        
        * As the final stage of this project, in order to create the TidyData.txt file, the 
          libraries *"reshape2"* and *"plyr"* are required.
            
                1. First we "melt" the wide table into long table grouping on subjectid and 
                   activityname. This create a tall (and tidy) table with "variable" column for 
                   all the features and value column for the measurement of the features for each 
                   and every subject and activity.
        
                2. Use the "ddply" from the plyr package to summarize the data using mean function 
                   as mentioned in the final step 5 of the requirements.
                   
                3. Write out the file using write.table with the row.name=FALSE option.
                
##Conclusions:         