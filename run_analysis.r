
#step 1: merge the training and test data set

subject_train <- fread("train/subject_train.txt")
y_train <- fread("train/y_train.txt")
x_train <- fread("train/X_train.txt")

subject_test <- fread("test/subject_test.txt")
y_test <- fread("test/y_test.txt")
x_test <- fread("test/X_test.txt")

#merge rows of training and test data set for all three (subject, y and x)
subject <- rbind(subject_train, subject_test)
y <- rbind(y_train, y_test)
x <- rbind(x_train, x_test)

#step 2: extract the columns that correspond to mean and SD measurements

features <- fread("features.txt")
setnames(features, c("id", "name"))
colnames(x) <- features$name
features <- features[grep("mean\\(\\)|std\\(\\)", features$name)]
x <- x[, features$name, with=FALSE]


#step 3: use descriptive activity names

activities <- fread("activity_labels.txt")
y <- merge(activities, y, by="V1")


#step 4: use descriptive variable names

colnames(subject) <- c("subject")
colnames(y) <- c("activityid","activity")
#x already has descriptive variable names takes from features.txt
td <- cbind(subject, select(y,activity), x)


#step 5: create a new data set with means for all measurements per subject & activity combination
td_mean <- td %>% group_by(subject, activity)  %>% summarise_each(funs(mean))






