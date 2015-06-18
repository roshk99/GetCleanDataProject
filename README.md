# README.md

## Summary:
The raw data the run_analysis.R script uses comes from an experiment done by 30 people who performed 6 activities each. These 30 people were split into test and training data sets. Measurements taken include accelerations and angular velocities on multiple axes. The script combines data from multiple files, takes only the mean and standard deviation of the measurements, and outputs a tidy data set in the format:

Subject Activity Measurement1 Measurement 2 ...

180 observations of 68 variables

## Data Source
This project uses the "Human Activity Recognition Using Smartphones Dataset" by run_analysis.R from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Replication Requirements
After downloading the raw data from the link above, place the run_analysis.R script at the same level as the folder 'UCI HAR Dataset'. Run the script and it will place the tidy_data.txt in the 'UCI HAR Dataset' 

## Process:
* For both test and training data separately, loads all the files into R and converts the activity for each observation to a description (WALKING, LAYING, etc.)
* For both test and training data separately, appends the columns for the activity and subject to the measurement data
* Merges the training and test data sets
* Extracts only the measurements of the mean and standard deviation
* Collapse the data set so it contains the average of each measurement for a unique activity/subject combination
* Writes this data set to the file 'tidy_data.txt'