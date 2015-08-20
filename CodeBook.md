Original Data Files
=================================================================================================================================================================
One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
All data files were programatically downloaded and unzipped to the working directory using R as 'UCI HAR Dataset'.

How the script works
=================================================================================================================================================================
The script 'run_analysis.R':  

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 

The input files for the 'run_analysis.R' script are:

- 'features.txt' contains a list of the different measurements and transformations performed by the original authors
- 'X_train.txt' and 'X_test.txt' contain the values for the measurements and transformations listed on 'features.txt' for a total of 30 study subjects so that each row represents one measurement or transformation for one activity by one subject.
- 'train_label' and 'test_label' contain the corresponding labels of activities being performed by the subjects while the measurements were being taken. These activities are:

1 = WALKING

2 = WALKING_UPSTAIRS

3 = WALKING_DOWNSTAIRS

4 = SITTING

5 = STANDING

6 = LAYING
 

The variables used in the 'run_analysis.R' script are:
'features' is a string of characters of length = 561 containing the data from the 'features.txt' file. 
'meansandstds' is a vector containing the 73 labels for the characters in 'features' corresponding to the means and stds of the measurements and transformations.

'train_set' and 'test_set' are dataframes initially containing the data in files 'X_train.txt' and 'X_test.txt'. 
Then, they received 'features' as column names and a subset of columns was selected according to the 73 labels chosen through 'meansandstandards'. 

'train_label' and 'test_label' describe the activities being performed by the subject while generating the 'train_set' and 'test_set' dataframes, respectively. 
After replacing the numeric labels for descriptive activity names, these labels were added to their respective rows in their respective dataframes. 

'subject_train' and 'subject_test' carry the subject ID corresponding to the activities and measurements in the 'train_set' and 'test_set' dataframes, and were also reunited to their respective datasets.

The output file for the 'run_analysis.R' script is tidy_dataset.txt