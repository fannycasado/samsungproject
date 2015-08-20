### Access and set up the datasets flat files
features <- read.table(".\\UCI HAR Dataset\\features.txt", header=FALSE, sep=" ")
features <- as.character(features$V2)
train_set <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", header= FALSE)
colnames(train_set) <- features
test_set <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", header = FALSE)
colnames(test_set) <- features

train_label <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", header=FALSE)
test_label <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", header=FALSE)

## Extracts only the measurements on the mean and standard deviation for each measurement
### Choose mean and stds
meansandstds <- c(1:6,41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228,240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543, 555:561)
train_set <- train_set[,meansandstds]
test_set <- test_set[,meansandstds]

## Uses descriptive activity names to name the activities in the data set
### Replace labels for activities
colnames(train_label) <- "Activity"
train_label1 <- replace(train_label, train_label==1, "WALKING")
train_label2 <- replace(train_label1, train_label1==2, "WALKING_UPSTAIRS")
train_label3 <- replace(train_label2, train_label2==3, "WALKING_DOWNSTAIRS")
train_label4 <- replace(train_label3, train_label3==4, "SITTING")
train_label5 <- replace(train_label4, train_label4==5, "STANDING")
train_label6 <- replace(train_label5, train_label5==6, "LAYING")
train_set <- cbind(train_label6, train_set)

colnames(test_label) <- "Activity"
test_label1 <- replace(test_label, test_label==1, "WALKING")
test_label2 <- replace(test_label1, test_label1==2, "WALKING_UPSTAIRS")
test_label3 <- replace(test_label2, test_label2==3, "WALKING_DOWNSTAIRS")
test_label4 <- replace(test_label3, test_label3==4, "SITTING")
test_label5 <- replace(test_label4, test_label4==5, "STANDING")
test_label6 <- replace(test_label5, test_label5==6, "LAYING")
test_set <- cbind(test_label6, test_set)

## Add information about each subject.
subject_train<- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", header=FALSE, sep=" ")
colnames(subject_train) <- "Subject"
train_set <- cbind(subject_train, train_set)
subject_test<- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", header=FALSE, sep=" ")
colnames(subject_test) <- "Subject"
test_set <- cbind(subject_test, test_set)

## Merges the training and the test sets to create one data set
tidy <- rbind(train_set, test_set)
tidy <- tidy[order(tidy$Subject, tidy$Activity),]
write.table(tidy, file="tidy_dataset.txt", row.names = FALSE)

