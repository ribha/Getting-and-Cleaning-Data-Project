###Getting and Cleaning Data: Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

The data for the project is taken from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Included in this repository
1. a run_analysis.r script that can be used to create a tidy data set using the data from the URL above
2. a code book that describes the variables, the data, and any transformations or work that was performed to clean up the data (using the R script. 
This file is called CodeBook.md. 

##Steps to run the R script
To run the R script, the files from the URL above should be downloaded and unzipped. 
The working directory should be set to the folder "UCI HAR Dataset" in the unzipped data folder. 

##Output of the R script
On running the R script, following two tidy data objects will be created
1. *td:: this data table has mean and std measurements for all subjects and activity combinations (both train and test) present in the untidy data set.
Column names are descriptive and so are the activity values.
Subjects are numbered from 1-30  
This has 10299 rows
2. *td_mean:* this data table has the -average- values for each mean and std measurement, per subject and activity. This is an aggregate created using td. 
This has 35 rows. 

Refer to codebook.md for more information on the variables and data points, and the transformations done in R script to create the tidy data. 