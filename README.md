# Getting-CleaningData
Repo for Project Assignment of Course - Getting and Cleaning Data 
==================================================================
Peer-graded Assignment: Getting and Cleaning Data Course Project
Version 1.0
==================================================================
Shreekant V Shinde
==================================================================


The file cleaned and analysed data.  This data is taken from experiments that have been carried out with a group of 30 
volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, the data has been captured for 3-axial linear acceleration and 
3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the 
data manually. 


This data has been extracted from the obtained dataset which was randomly partitioned into two sets, where 70% of the volunteers 
was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and 
then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to 
have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and 
frequency domain. 

For each record it is provided:
======================================

- An identifier of the subject who carried out the experiment (Subject ID)
- The name of activity peformed (i.e. WALKING, SITTING etc.)
- For the rest of colunmns shows the average of each measurement

The dataset includes the following files:
=========================================

- 'ReadMe.txt': Shows information about the variables used on the feature vector.

- 'run_analysis.R': It is the R script file. 

- 'Codebook.md': It is the code book that describes the variables, the data, work that is performed to clean up the data 


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] & [2]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

[2] Shreekant Shinde.  This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Aug 2018
