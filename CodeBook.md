##DATA DICTIONARY - TIDY_MOVEMENT_DATA.txt


The data is avaiable for download at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##Feature Selection

The features selected for the tidy data came from the transformation of the data in the "Human Activity Recognition Using 
Smartphones Dataset Version 1.0", which been taken from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz data were captured, of accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.


These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ tGravityAcc-XYZ tBodyAccJerk-XYZ tBodyGyro-XYZ tBodyGyroJerk-XYZ tBodyAccMag tGravityAccMag tBodyAccJerkMag tBodyGyroMag tBodyGyroJerkMag fBodyAcc-XYZ fBodyAccJerk-XYZ fBodyGyro-XYZ fBodyAccMag fBodyAccJerkMag fBodyGyroMag fBodyGyroJerkMag

angle(): Angle between two vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean tBodyAccMean tBodyAccJerkMean tBodyGyroMean tBodyGyroJerkMean



##Feature Vector variables:
###mean() : mean values of multiple measurements of the original variables. 
        Data Type: Real number

###std(): Standard deviation of multiple measurements of the original variables. 
        Data Type: Real number

###activity_id: Identifier, identifying the activity of each subject Type: 
        Data Type: Integer Values: 1 : 6

###activity_name: Descriptive name of each subject's activity Type: 
        Data Type: Factor Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

###subject_id : Identifier, identifying each subject Type: 
        Data Type: Integer Values: 1 : 30
