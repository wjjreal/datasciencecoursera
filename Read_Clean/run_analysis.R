## read train dataset
train_ds <- read.table("data/UCI HAR Dataset/train/X_train.txt")
## read test dataset
test_ds <- read.table("data/UCI HAR Dataset/test/X_test.txt")
## merge train and test dataset
one_ds <- rbind(train_ds,test_ds)

## dataset names
ds_name <- read.table("data/UCI HAR Dataset/features.txt")
## assign column names
names(one_ds) <- ds_name[,2]
## extract dataset with mean and std measurement
extract_ds <- one_ds[,grep("mean|std",ds_name[,2])]

## train activity
train_activity <- read.table("data/UCI HAR Dataset/train/Y_train.txt")
## test activity
test_activity <- read.table("data/UCI HAR Dataset/test/Y_test.txt")
## merge train and test activity
one_activity <- rbind(train_activity, test_activity)
## map index to activity description
one_activity$V1 <- sapply(one_activity$V1, switch, "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
## change column name
names(one_activity) <- c("Activity")
## add activity to data set
one_ds <- cbind(one_activity, one_ds)

## train subject
train_subject <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
## test subject
test_subject <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
## merge train and test subject
one_subject <- rbind(train_subject, test_subject)
## change column name
names(one_subject) <- c("Subject")
## add subject to data set
one_ds <- cbind(one_subject, one_ds)


