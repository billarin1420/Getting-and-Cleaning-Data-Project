#Coursera Getting and Cleaning Data: Codebook
It is the codebook for the course project “Getting and Cleaning Data”.
##1. Source Data Set
Description below about the source raw data for the project was literally taken from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
The project data set can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Output: Tidy Datasets
Source datasets went through several transformations getting at the end two tidy data sets, final_set and final_set_averages, following lines explained the insight on the different transformation conducted on the source data.

The fist step was to merge the training and the test datasets into one data set. Likewise, the 30 volunteers conducting the testing and training experiments were merge into one datasets. The result of this initial transformations are the following datasets:

data_x: Output dataset after merging training and test source datasets, getting a dataset with 10,299 observations for 561 variables (ie. features); it is a dataframe with 10,299 rows and 561 columns.

data_y: Output dataset that includes for each of the 10,299 observations what activity (ie. walking, walking_upstairs, walking_downstairs, sitting, standing, laying) was the volunteer conducting. The activities are codified as follows:
* 1: walking
* 2: walking_upstairs
* 3: walking_downstairs
* 4: sitting
* 5: standing
* 6: laying

set_subject: Output dataset that includes for each of the 10,299 observations what volunteer was conducting the observation. Volunteers are code from 1 to 30. This dataset is a dataframe with 10,299 rows and 1 column.

The next transformation conducted was to leave only the variables associated to mean and the standard deviation, getting the following dataset:

* subset_mean_std: Output dataset including for each of the 10,299 observations only the variables having to do with the mean and standard deviation. This dataset is a dataframe of 10,299 rows and 66 columns.

After previous transformation, the data_y dataset is transformed to give every observation the proper naming (ie. walking, walking_upstairs, walking_downstairs, sitting, standing, laying)based on the activities coding.  This dataset is a table of 10,299 rows and 1 column.

Up to this point there are three different datasets as follows: set_subject (10,299 x 1), subset_mean_std (10,299 x 66) and data_y (10,299 x 1).

The last step to get one of the tidy datasets (ie. final_set) is to merge the three datasets mentioned above into one and give the proper naming format; for the latter, proper naming was giving to variables, for instance “Acc” was changed for “Acceleration”, “Mag” for “Magnitud” and so forth, getting the following dataset:

* final_set:  One of the final datasets for the project which has 10,299 observations for 68 variables (ie. 66 features associated to mean and standard deviation plus the volunteers id and the activities name). This dataset is a dataframe of 10,299 rows and 68 columns, below the names of each column, naming has been given so that each self-explains as follows:

	* [1] "TimeDomain.BodyAcceleration.Mean...X"                                    
	* [2] "TimeDomain.BodyAcceleration.Mean...Y"                                    
	* [3] "TimeDomain.BodyAcceleration.Mean...Z"                                    
	* [4] "TimeDomain.BodyAcceleration.StandardDeviation...X"                       
	* [5] "TimeDomain.BodyAcceleration.StandardDeviation...Y"                       
	* [6] "TimeDomain.BodyAcceleration.StandardDeviation...Z"                       
	* [7] "TimeDomain.GravityAcceleration.Mean...X"                                 
	* [8] "TimeDomain.GravityAcceleration.Mean...Y"                                 
	* [9] "TimeDomain.GravityAcceleration.Mean...Z"                                 
	* [10] "TimeDomain.GravityAcceleration.StandardDeviation...X"                    
	* [11] "TimeDomain.GravityAcceleration.StandardDeviation...Y"                    
	* [12] "TimeDomain.GravityAcceleration.StandardDeviation...Z"                    
	* [13] "TimeDomain.BodyAccelerationJerk.Mean...X"                                
	* [14] "TimeDomain.BodyAccelerationJerk.Mean...Y"                                
	* [15] "TimeDomain.BodyAccelerationJerk.Mean...Z"                                
	* [16] "TimeDomain.BodyAccelerationJerk.StandardDeviation...X"                   
	* [17] "TimeDomain.BodyAccelerationJerk.StandardDeviation...Y"                   
	* [18] "TimeDomain.BodyAccelerationJerk.StandardDeviation...Z"                   
	* [19] "TimeDomain.BodyAngularSpeed.Mean...X"                                    
	* [20] "TimeDomain.BodyAngularSpeed.Mean...Y"                                    
	* [21] "TimeDomain.BodyAngularSpeed.Mean...Z"                                    
	* [22] "TimeDomain.BodyAngularSpeed.StandardDeviation...X"                       
	* [23] "TimeDomain.BodyAngularSpeed.StandardDeviation...Y"                       
	* [24] "TimeDomain.BodyAngularSpeed.StandardDeviation...Z"                       
	* [25] "TimeDomain.BodyAngularAcceleration.Mean...X"                             
	* [26] "TimeDomain.BodyAngularAcceleration.Mean...Y"                             
	* [27] "TimeDomain.BodyAngularAcceleration.Mean...Z"                             
	* [28] "TimeDomain.BodyAngularAcceleration.StandardDeviation...X"                
	* [29] "TimeDomain.BodyAngularAcceleration.StandardDeviation...Y"                
	* [30] "TimeDomain.BodyAngularAcceleration.StandardDeviation...Z"                
	* [31] "TimeDomain.BodyAccelerationMagnitude.Mean.."                             
	* [32] "TimeDomain.BodyAccelerationMagnitude.StandardDeviation.."                
	* [33] "TimeDomain.GravityAccelerationMagnitude.Mean.."                          
	* [34] "TimeDomain.GravityAccelerationMagnitude.StandardDeviation.."             
	* [35] "TimeDomain.BodyAccelerationJerkMagnitude.Mean.."                         
	* [36] "TimeDomain.BodyAccelerationJerkMagnitude.StandardDeviation.."            
	* [37] "TimeDomain.BodyAngularSpeedMagnitude.Mean.."                             
	* [38] "TimeDomain.BodyAngularSpeedMagnitude.StandardDeviation.."                
	* [39] "TimeDomain.BodyAngularAccelerationMagnitude.Mean.."                      
	* [40] "TimeDomain.BodyAngularAccelerationMagnitude.StandardDeviation.."         
	* [41] "FrequencyDomain.BodyAcceleration.Mean...X"                               
	* [42] "FrequencyDomain.BodyAcceleration.Mean...Y"                               
	* [43] "FrequencyDomain.BodyAcceleration.Mean...Z"                               
	* [44] "FrequencyDomain.BodyAcceleration.StandardDeviation...X"                  
	* [45] "FrequencyDomain.BodyAcceleration.StandardDeviation...Y"                  
	* [46] "FrequencyDomain.BodyAcceleration.StandardDeviation...Z"                  
	* [47] "FrequencyDomain.BodyAccelerationJerk.Mean...X"                           
	* [48] "FrequencyDomain.BodyAccelerationJerk.Mean...Y"                           
	* [49] "FrequencyDomain.BodyAccelerationJerk.Mean...Z"                           
	* [50] "FrequencyDomain.BodyAccelerationJerk.StandardDeviation...X"              
	* [51] "FrequencyDomain.BodyAccelerationJerk.StandardDeviation...Y"              
	* [52] "FrequencyDomain.BodyAccelerationJerk.StandardDeviation...Z"              
	* [53] "FrequencyDomain.BodyAngularSpeed.Mean...X"                               
	* [54] "FrequencyDomain.BodyAngularSpeed.Mean...Y"                               
	* [55] "FrequencyDomain.BodyAngularSpeed.Mean...Z"                               
	* [56] "FrequencyDomain.BodyAngularSpeed.StandardDeviation...X"                  
	* [57] "FrequencyDomain.BodyAngularSpeed.StandardDeviation...Y"                  
	* [58] "FrequencyDomain.BodyAngularSpeed.StandardDeviation...Z"                  
	* [59] "FrequencyDomain.BodyAccelerationMagnitude.Mean.."                        
	* [60] "FrequencyDomain.BodyAccelerationMagnitude.StandardDeviation.."           
	* [61] "FrequencyDomain.BodyAccelerationJerkMagnitude.Mean.."                
	* [62] "FrequencyDomain.BodyAccelerationJerkMagnitude.StandardDeviation.."   
	* [63] "FrequencyDomain.BodyAngularSpeedMagnitude.Mean.."                    
	* [64] "FrequencyDomain.BodyAngularSpeedMagnitude.StandardDeviation.."       
	* [65] "FrequencyDomain.BodyAngularAccelerationMagnitude.Mean.."             
	* [66] "FrequencyDomain.BodyAngularAccelerationMagnitude.StandardDeviation.."
	* [67] "Activities"                                                              
	* [68] "Subject"

The second tidy dataset (ie. the one that should be submitted as deliverable for the project) is obtained by taking the final_set dataset and taking the average for every single variable for each activity and each subject. This dataset is a table of 180 rows and 68 columns. The name of this tidy dataset is final_set_averages. Proper ordering has been given to the variables, getting the columns layout as follows:

	* [1] "Activities"                                                              
	* [2] "Subject"
	* [3] "TimeDomain.BodyAcceleration.Mean...X"                                    
	* [4] "TimeDomain.BodyAcceleration.Mean...Y"                                    
	* [5] "TimeDomain.BodyAcceleration.Mean...Z"                                    
	* [6] "TimeDomain.BodyAcceleration.StandardDeviation...X"                       
	* [7] "TimeDomain.BodyAcceleration.StandardDeviation...Y"                       
	* [8] "TimeDomain.BodyAcceleration.StandardDeviation...Z"                       
	* [9] "TimeDomain.GravityAcceleration.Mean...X"                                 
	* [10] "TimeDomain.GravityAcceleration.Mean...Y"                                 
	* [11] "TimeDomain.GravityAcceleration.Mean...Z"                                 
	* [12] "TimeDomain.GravityAcceleration.StandardDeviation...X"                    
	* [13] "TimeDomain.GravityAcceleration.StandardDeviation...Y"                    
	* [14] "TimeDomain.GravityAcceleration.StandardDeviation...Z"                    
	* [15] "TimeDomain.BodyAccelerationJerk.Mean...X"                                
	* [16] "TimeDomain.BodyAccelerationJerk.Mean...Y"                                
	* [17] "TimeDomain.BodyAccelerationJerk.Mean...Z"                                
	* [18] "TimeDomain.BodyAccelerationJerk.StandardDeviation...X"                   
	* [19] "TimeDomain.BodyAccelerationJerk.StandardDeviation...Y"                   
	* [20] "TimeDomain.BodyAccelerationJerk.StandardDeviation...Z"                   
	* [21] "TimeDomain.BodyAngularSpeed.Mean...X"                                    
	* [22] "TimeDomain.BodyAngularSpeed.Mean...Y"                                    
	* [23] "TimeDomain.BodyAngularSpeed.Mean...Z"                                    
	* [24] "TimeDomain.BodyAngularSpeed.StandardDeviation...X"                       
	* [25] "TimeDomain.BodyAngularSpeed.StandardDeviation...Y"                       
	* [26] "TimeDomain.BodyAngularSpeed.StandardDeviation...Z"                       
	* [27] "TimeDomain.BodyAngularAcceleration.Mean...X"                             
	* [28] "TimeDomain.BodyAngularAcceleration.Mean...Y"                             
	* [29] "TimeDomain.BodyAngularAcceleration.Mean...Z"                             
	* [30] "TimeDomain.BodyAngularAcceleration.StandardDeviation...X"                
	* [31] "TimeDomain.BodyAngularAcceleration.StandardDeviation...Y"                
	* [32] "TimeDomain.BodyAngularAcceleration.StandardDeviation...Z"                
	* [33] "TimeDomain.BodyAccelerationMagnitude.Mean.."                             
	* [34] "TimeDomain.BodyAccelerationMagnitude.StandardDeviation.."                
	* [35] "TimeDomain.GravityAccelerationMagnitude.Mean.."                          
	* [36] "TimeDomain.GravityAccelerationMagnitude.StandardDeviation.."             
	* [37] "TimeDomain.BodyAccelerationJerkMagnitude.Mean.."                         
	* [38] "TimeDomain.BodyAccelerationJerkMagnitude.StandardDeviation.."            
	* [39] "TimeDomain.BodyAngularSpeedMagnitude.Mean.."                             
	* [40] "TimeDomain.BodyAngularSpeedMagnitude.StandardDeviation.."                
	* [41] "TimeDomain.BodyAngularAccelerationMagnitude.Mean.."                      
	* [42] "TimeDomain.BodyAngularAccelerationMagnitude.StandardDeviation.."         
	* [43] "FrequencyDomain.BodyAcceleration.Mean...X"                               
	* [44] "FrequencyDomain.BodyAcceleration.Mean...Y"                               
	* [45] "FrequencyDomain.BodyAcceleration.Mean...Z"                               
	* [46] "FrequencyDomain.BodyAcceleration.StandardDeviation...X"                  
	* [47] "FrequencyDomain.BodyAcceleration.StandardDeviation...Y"                  
	* [48] "FrequencyDomain.BodyAcceleration.StandardDeviation...Z"                  
	* [49] "FrequencyDomain.BodyAccelerationJerk.Mean...X"                           
	* [50] "FrequencyDomain.BodyAccelerationJerk.Mean...Y"                           
	* [51] "FrequencyDomain.BodyAccelerationJerk.Mean...Z"                           
	* [52] "FrequencyDomain.BodyAccelerationJerk.StandardDeviation...X"              
	* [53] "FrequencyDomain.BodyAccelerationJerk.StandardDeviation...Y"              
	* [54] "FrequencyDomain.BodyAccelerationJerk.StandardDeviation...Z"              
	* [55] "FrequencyDomain.BodyAngularSpeed.Mean...X"                               
	* [56] "FrequencyDomain.BodyAngularSpeed.Mean...Y"                               
	* [57] "FrequencyDomain.BodyAngularSpeed.Mean...Z"                               
	* [58] "FrequencyDomain.BodyAngularSpeed.StandardDeviation...X"                  
	* [59] "FrequencyDomain.BodyAngularSpeed.StandardDeviation...Y"                  
	* [60] "FrequencyDomain.BodyAngularSpeed.StandardDeviation...Z"                  
	* [61] "FrequencyDomain.BodyAccelerationMagnitude.Mean.."                        
	* [62] "FrequencyDomain.BodyAccelerationMagnitude.StandardDeviation.."           
	* [63] "FrequencyDomain.BodyAccelerationJerkMagnitude.Mean.."                
	* [64] "FrequencyDomain.BodyAccelerationJerkMagnitude.StandardDeviation.."   
	* [65] "FrequencyDomain.BodyAngularSpeedMagnitude.Mean.."                    
	* [66] "FrequencyDomain.BodyAngularSpeedMagnitude.StandardDeviation.."       
	* [67] "FrequencyDomain.BodyAngularAccelerationMagnitude.Mean.."             
	* [68] "FrequencyDomain.BodyAngularAccelerationMagnitude.StandardDeviation.."

End of the Code Book
