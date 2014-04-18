Code book
=========================
 
Introduction
-------------------------   

The data transformation process done by run_analysis.R is build not upon the raw signals files (**train/Inertial Signals/** and **test/Inertial Signals/**), but the **train/** and **test/** files, meaning on the variables calculated for each obeservation. Below in the section **Raw data and variables build upon it (Input Data)** the process is described based on the documentation found in the original data set.  

The section **Output data (final tidy data set)** describes the final tidy set.  

The section **Study design** describes the processing steps done in script run_analysis.R.    


Raw data and variables build upon it (Input Data)
--------------------------------------------------    

The raw data is build from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
Based on this signals a 561-feature vector was build with time and frequency domain variables. 

**Types of signals**:

* tAcc-XYZ -> acccelaration, standard gravity units 'g' m/s^2  
 tGyro-XYZ -> angular velocity, radians per secord  r/s
 
* Similarly, the acceleration signal was then separated into body and gravity acceleration signals
   (tBodyAcc-XYZ and tGravityAcc-XYZ) acceleration
   
   tBodyAcc-XYZ -> standard gravity units 'g'  
   tGravityAcc-XYZ -> standard gravity units 'g'

* the body linear acceleration and angular velocity were derived in time to obtain
 Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
 derivate of the acceleration -> jerk
 
 tBodyAccJerk-XYZ -> derivate of the acceleration -> jerk m/s^3  
 tBodyGyroJerk-XYZ -> angular acceleration  -> radian/s^2
 
* tBodyAccMag -> norm of a vector  
 tGravityAccMag -> norm of a vector  
 tBodyAccJerkMag -> norm of a vector  
 tBodyGyroMag -> norm of a vector  
 tBodyGyroJerkMag -> norm of a vector  

* Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag

**Signal Domains**: t - time domain, f - frequency domain


Variables filtered out for the purpose of preparing the tidy data set
--------------------------------------------------   
The processing steps of the analysis were performed only on mean (mean()) and standard deviation (std()) variables build upon the signals above.

The complete list of variables found in input files (**bold below means used to calculate the final data set**):

Variable name  | Description
------------- | -------------
**mean()** | Mean value
**std()** | Standard deviation
mad() | Median absolute deviation 
max() | Largest value in array
min() | Smallest value in array
sma() | Signal magnitude area
energy() | Energy measure. Sum of the squares divided by the number of values. 
iqr() | Interquartile range 
entropy() | Signal entropy
arCoeff() | Autorregresion coefficients with Burg order equal to 4
correlation() | correlation coefficient between two signals
maxInds() | index of the frequency component with largest magnitude
meanFreq() | Weighted average of the frequency components to obtain a mean frequency
skewness() | skewness of the frequency domain signal 
kurtosis() | kurtosis of the frequency domain signal 
bandsEnergy() | Energy of a frequency interval within the 64 bins of the FFT of each window.
angle() | Angle between to vectors.


**NOTE**  
Variables were normalized and bounded within [-1,1].  




Output data (final tidy data set)
=========================

The final tidy set contains one row for each subject and each activity (including the combinations of actvitity and subject not found in the the raw data, set then to **NA**). Because there were 30 subjects and 6 activities the number of rows is 30 x 6 = 180.

There are 2 types of columns:
* Dimension (mean of the measures were calculated grouping on them)
      * Subject - who was performing this activity (Values: 1 -30)
      * Activity - what kind of activity was performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* Average mean variables and standard deviation variables. The **t** Variables are in time domain, whereas the **f** in frequency domain (FFT was aplied to them). The **XYZ** denote the direction of the 3-axial signals. There are 33 averages (grouped by Subject, Activity) for standard deviation variables  and 33 averages (grouped by Subject, Activity) for mean variables.
* Therefore the number of columns in the tidy data set is 2 + 33 + 33 = **68**



List of all variables found in the in the tidy set:  
 
Mean variables | Standard deviation variables | Units (normalized to [-1,1])
------------- | ------------- | ------------------
tBodyAcc-mean()-X  | tBodyAcc-std()-X | acccelaration, standard gravity units 'g' m/s^2
tBodyAcc-mean()-Y  | tBodyAcc-std()-Y | acccelaration, standard gravity units 'g' m/s^2
tBodyAcc-mean()-Z  | tBodyAcc-std()-Z | acccelaration, standard gravity units 'g' m/s^2
tGravityAcc-mean()-X | tGravityAcc-std()-X | acccelaration, standard gravity units 'g' m/s^2
tGravityAcc-mean()-Y  | tGravityAcc-std()-Y | acccelaration, standard gravity units 'g' m/s^2
tGravityAcc-mean()-Z  | tGravityAcc-std()-Z | acccelaration, standard gravity units 'g' m/s^2
tBodyAccJerk-mean()-X  | tBodyAccJerk-std()-X | jerk m/s^3
tBodyAccJerk-mean()-Y | tBodyAccJerk-std()-Y | jerk m/s^3
tBodyAccJerk-mean()-Z  | tBodyAccJerk-std()-Z | jerk m/s^3
tBodyGyro-mean()-X  | tBodyGyro-std()-X | angular velocity, radians per secord  r/s
tBodyGyro-mean()-Y  | tBodyGyro-std()-Y | angular velocity, radians per secord  r/s
tBodyGyro-mean()-Z  | tBodyGyro-std()-Z | angular velocity, radians per secord  r/s
tBodyGyroJerk-mean()-X | tBodyGyroJerk-std()-X | angular acceleration  -> radian/s^2
tBodyGyroJerk-mean()-Y  | tBodyGyroJerk-std()-Y | angular acceleration  -> radian/s^2
tBodyGyroJerk-mean()-Z | tBodyGyroJerk-std()-Z | angular acceleration  -> radian/s^2
tBodyAccMag-mean() | tBodyAccMag-std() | norm of a vector (number)
tGravityAccMag-mean() | tGravityAccMag-std() | norm of a vector (number)
tBodyAccJerkMag-mean() | tBodyAccJerkMag-std() | norm of a vector (number)
tBodyGyroMag-mean() | tBodyGyroMag-std() | norm of a vector (number)
tBodyGyroJerkMag-mean() | tBodyGyroJerkMag-std() | norm of a vector (number)
fBodyAcc-mean()-X | fBodyAcc-std()-X | 
fBodyAcc-mean()-Y | fBodyAcc-std()-Y | 
fBodyAcc-mean()-Z | fBodyAcc-std()-Z | 
fBodyAccJerk-mean()-X | fBodyAccJerk-std()-X | 
fBodyAccJerk-mean()-Y | fBodyAccJerk-std()-Y | 
fBodyAccJerk-mean()-Z | fBodyAccJerk-std()-Z | 
fBodyGyro-mean()-X | fBodyGyro-std()-X | 
fBodyGyro-mean()-Y | fBodyGyro-std()-Y | 
fBodyGyro-mean()-Z | fBodyGyro-std()-Z | 
fBodyAccMag-mean() | fBodyAccMag-std() | 
fBodyBodyAccJerkMag-mean() | fBodyBodyAccJerkMag-std() | 
fBodyBodyGyroMag-mean()       | fBodyBodyGyroMag-std() | 
fBodyBodyGyroJerkMag-mean() | fBodyBodyGyroJerkMag-std() | 

  
      																																																													
Therefore the final tidy dataset  contains a data set with the average of each variable of type mean or standard deviation (2x33) for each activity and each subject. The size is  ((30 subjects x 6 activities) X (2x33 columns + subject column + activity column)), meaning 180 x 68.

    
Study design
=========================
The script run_analysis.R (a function) is performing the following steps (the code is commented extensive):  

1. read the activity labels activity_labels.txt  
2. read the feature names from features.txt and filter onyl the std() and mean() variables  
3. read and merge (subject_test.txt and subject_train.txt) the subject ids on whom each observation was performed  
4. read and merge (y_test.txt and y_train.txt) the activity label ids on which each observation was performed  
5. read, merge (x_test.txt and x_train.txt) amd filter the data only to include mean and standard deviation variables  
6. Create a final  (not aggregat yet) dataset (measurements) that consist of information about activity, subject and the 66 mean and standard devation variables.  Give it descriptive names.  
7. Create a second tidy data set with 'aggregates' which means:  
      *   one row with average of each variable for each activity and each subject.   
      *   it contains rows with NA values for combinations of activity and subject not found in the first data set created in Step 6.  
8. return a list with 2 elements:  
      *   measurements - data set created in Step 6  
      *   aggregated_measures - data set created in Step 7  

**Usage example**  
```
      library(xlsx)
      data <- run_analysis()
      write.xlsx(data$aggregated_measures, "aggregated_measures.xlsx", col.names = TRUE, row.names = FALSE,showNA=FALSE)
```
