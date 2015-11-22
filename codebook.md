#Codebook for Getting and Cleaning Data Course Project

The data for the project is taken from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

On extracting the files, a folder called "UCI HAR Dataset" will contain the data files. There is also a README file (along with the data files) that explains that various files and the variables included in this (input) data.

##Data used for the course project
The data included is for human activity recognition using smartphones, and contains measurements from experiments carried out on 30 volunteers. Data is randomly partitioned into a training set (70%) and a test set (30%).

1. **Subject:** This is a number (1-30) representing each volunteer who took part in the experiments. 

2. **Activity:** Is one of the six activities included in the experiments: 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

3. **Features:** There are 561 features that correspond to the measurements done for each subject and activity. Refer to features_info (included in the downloaded data) for more information on each measurement.

4. **Test and Train data:** This corresponds to output of the experiments and contains the measurement value for each of the 561 features, against each subject and activity. This data is present in two different folders (test and train) in the downloaded data. Also, the subject Ids, activity Ids and the measurement values are each present in different files.

Note: Downloaded data contains some additional data in a folder named "Inertial Signals" for both train and test data sets. This data is ignored for the purpose of this course project. 

##Variables & Transformations 
1. Merge the train and test data sets: The format of the two data sets is exactly same, and there are three files per folder (test and train). The three files correspond to subject Ids, activity Ids and the feature (measurement) values for each of the 561 measurements. So total there are six files, that are read into data tables and then merged for the train and test sets. The resulting output is stored in three data tables: subject, y (activity Ids) and x (measurement values).
2. Subset the feature list to select only those measurements that correspond to mean or standard deviation. This is done using a grep on feature name. For the variable x, subset the data table to include only the columns corresponding to this shorter feature list. 
3. Add activity name to the variable y as a new column (along with activity Ids), by merging with the data in activity_labels.txt. This helps to get the descriptive names for activities rather than the Ids. 
4. Use descriptive variable names for all the columns in subject, y and x. For subject, the column name is called "subject". For y, the two columns are named "activityid" and "activity". For x, the column names correpsond to the feature name taken from features.txt. 
5. Merge the variables subject, y and x to result in a single tidy data set (called td) that has the measures for each subject and activity from both test and train set. This is done using cbind.
6. Create a new aggregate data set called td_mean using td. This contains the average values of all measurements in td, grouped by subject and activity. 

td has 10299 rows
td_mean has 35 rows

