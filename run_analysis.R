# Combine the training data
training = read.csv("UCI_HAR_Dataset/train/X_train.txt", sep="", header=FALSE)
training[,562] = read.csv("UCI_HAR_Dataset/train/Y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("UCI_HAR_Dataset/train/subject_train.txt", sep="", header=FALSE)

# Combine the testing data
testing = read.csv("UCI_HAR_Dataset/test/X_test.txt", sep="", header=FALSE)
testing[,562] = read.csv("UCI_HAR_Dataset/test/Y_test.txt", sep="", header=FALSE)
testing[,563] = read.csv("UCI_HAR_Dataset/test/subject_test.txt", sep="", header=FALSE)

# Read features and substitute feature names to make more readable
features = read.csv("UCI_HAR_Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Read the cctivity labler
activityLabels = read.csv("UCI_HAR_Dataset/activity_labels.txt", sep="", header=FALSE)

# Merge training and test sets together
completeData = rbind(training, testing)

# Get only the data on mean and std. dev.
reqCols <- grep(".*Mean.*|.*Std.*", features[,2])

# Keep only the neccessary features
features <- features[colsWeWant,]

# Add the last two columns (subject and activity)
reqCols <- c(reqCols, 562, 563)

# Remove the unwanted columns from the merged data
completeData <- completeData[,reqCols]

# Add the column names (features) to the merged data
colnames(completeData) <- c(features$V2, "Activity", "Subject")
colnames(completeData) <- tolower(colnames(allData))

currActv = 1
for (currActvLabel in activityLabels$V2) {
  completeData$activity <- gsub(currActv, currActvLabel, completeData$activity)
  currActv <- currActv + 1
}

completeData$activity <- as.factor(allData$activity)
completeData$subject <- as.factor(allData$subject)

tidy = aggregate(completeData, by=list(activity = completeData$activity, subject=completeData$subject), mean)

# Remove the subject and activity column whose mean is NA
tidy[,90] = NULL
tidy[,89] = NULL

write.table(tidy, "tidy.txt", sep="\t")
write.csv(tidy, "tidy.csv", sep="\t")
