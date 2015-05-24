
#Code Book for the TidyData.txt.

## Study Design

This TidyData.txt file is the result of gathering data from the experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities like **WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING** while wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the data was captured as 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The labels for the data were manually assigned from the video-recordings of the experiments. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

The features' measurements were captured from the accelerometer and gyroscope reading 
from the Samsung galaxy phone.The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.  

## Code Book

###Description of the data and the variables
This codebook describes the variables and the permissible values for TidyData.txt file.
The data was created as a long form dataset during the tidying process by the run_analysis.R script with each measurement calculated as a mean of the values grouped by the subject, activity and the features being measured.

The rest of this document describes the variables “subjectid", “activityname”,  “variable” and “mean and their values 

####subjectid:        
This is the identifier for the subject being monitored either as a “train”ing subject or a “test” subject.
There were 30 subjects being monitored for their activities and the values range from 1-30. 
There were no missing subjects and all 30 are present in the dataset. 
UNITS: All subject ids are numeric.

####activityname:  
These are the list of 7 possible activities that the subjects were monitored for.

UNITS: Activity names are character strings as shown below

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

####Features:         
These are the various features that are being measure during any of the above activities by the                    
subject. There are 79 features being measured. The names of the features measured indicate the
following aspects of the measurements that will help in making sense of the feature being
measured.
UNITS: The measures are numeric values measured in Hz.
Note: Features are normalized and bounded within [-1,1]

##### Time and Frequency
Each feature measurement is prefixed by a “t” or an “f” to indicate a “time” or a “freq” values captured at a constant 50Hz. A Fast Fourier Transform (FFT) was applied to some of these freq signals (indicated by the prefix f) producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

The suffix of the feature has a mean/std or meanfreq indicating whether the captured metric is a
mean or standard deviation or a Weighted average of the frequency components (to obtain a mean
frequency reading). 

#####These values may be further measured along the 3 axial signals along X, Y and Z directions. 

*X - the corresponding reading of the feature measured in the X axis

*Y - the corresponding reading of the feature measured in the Y axis

*Z - the corresponding reading of the feature measured in the Z axis

#####Body & Gravity
The second component of the name is “**body**” or “**gravity**” to indicate body or gravitational
signals as separated using a Butterworth low-pass filter. 

#####Linear and Angular metricx
The “acc” and “gyro” indicate that the feature was measured as the body linear     
acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ     
and tBodyGyroJerk-XYZ)

#####Magnitute
The “mag” magnitude of these three-dimensional signals were calculated using the Euclidean
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

#####The Feature List being reported

1. tbodyaccmeanx 
2. tbodyaccmeany

3. tbodyaccmeanz

4. tbodyaccstdx

5. tbodyaccstdy

6. tbodyaccstdz

7. tgravityaccmeanx

8. tgravityaccmeany

9. tgravityaccmeanz

10.tgravityaccstdx

11.tgravityaccstdy

12.tgravityaccstdz

13.tbodyaccjerkmeanx

14.tbodyaccjerkmeany

15.tbodyaccjerkmeanz

16.tbodyaccjerkstdx

17.tbodyaccjerkstdy

18.tbodyaccjerkstdz

19.tbodygyromeanx

20.tbodygyromeany

21.tbodygyromeanz

22.tbodygyrostdx

23.tbodygyrostdy

24.tbodygyrostdz

25.tbodygyrojerkmeanx

26.tbodygyrojerkmeany

27.tbodygyrojerkmeanz

28.tbodygyrojerkstdx

29.tbodygyrojerkstdy

30.tbodygyrojerkstdz

31.tbodyaccmagmean

32.tbodyaccmagstd

33.tgravityaccmagmean

34.tgravityaccmagstd

35.tbodyaccjerkmagmean

36.tbodyaccjerkmagstd

37.tbodygyromagmean

38.tbodygyromagstd

39.tbodygyrojerkmagmean

40.tbodygyrojerkmagstd

41.fbodyaccmeanx

42.fbodyaccmeany

43.fbodyaccmeanz

44.fbodyaccstdx

45.fbodyaccstdy

46.fbodyaccstdz

47.fbodyaccmeanfreqx

48.fbodyaccmeanfreqy

49.fbodyaccmeanfreqz

50.fbodyaccjerkmeanx

51.fbodyaccjerkmeany

52.fbodyaccjerkmeanz

53.fbodyaccjerkstdx

54.fbodyaccjerkstdy

55.fbodyaccjerkstdz

56.fbodyaccjerkmeanfreqx

57.fbodyaccjerkmeanfreqy

58.fbodyaccjerkmeanfreqz

59.fbodygyromeanx

60.fbodygyromeany

61.fbodygyromeanz

62.fbodygyrostdx

63.fbodygyrostdy

64.fbodygyrostdz

65.fbodygyromeanfreqx

66.fbodygyromeanfreqy

67.fbodygyromeanfreqz

68.fbodyaccmagmean

69.fbodyaccmagstd

70.fbodyaccmagmeanfreq

71.fbodybodyaccjerkmagmean

72.fbodybodyaccjerkmagstd

73.fbodybodyaccjerkmagmeanfreq

74.fbodybodygyromagmean

75.fbodybodygyromagstd

76.fbodybodygyromagmeanfreq

77.fbodybodygyrojerkmagmean

78.fbodybodygyrojerkmagstd

79.fbodybodygyrojerkmagmeanfreq


####mean:              
These values were been calculated for each of the feature that was measured for the subjects
performing the activities. The values are numeric. 


######Acknowledgements:

This entire cleaning operation would not have been possible without references to the following entries from the 
Discussion Groups like 

These datasets were a derivation of those mentioned in the following publication.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
