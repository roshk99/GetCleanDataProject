rm(list=ls())

# Reads File given name of file without .txt and the local location 
# (test folder, train folder, or blank for root directory)
getData <- function(filename, location="") {
    if (location == ""){
        path <- paste0(getwd(), "/", filename, ".txt", sep = "")
    }
    else {
        path <- paste0(getwd(), "/", location, "/", filename, ".txt", sep = "")
    }
    read.table(path)
}

# Activity Labels
activity_labels <- getData('activity_labels')

# Test Data
x_test <- getData('X_test', 'test')
subject_test <- getData('subject_test', 'test')
y_test <- getData('y_test', 'test')

# Covert 1-6 numbers to activity text
y_test2 <- lapply(y_test, function(x) activity_labels$V2[x])
test_data <- cbind(x_test, subject_test, y_test2)

# Train Data
x_train <- getData('X_train', 'train')
subject_train <- getData('subject_train', 'train')
y_train <- getData('y_train', 'train')

# Covert 1-6 numbers to activity text
y_train2 <- lapply(y_train, function(x) activity_labels$V2[x])
train_data <- cbind(x_train, subject_train, y_train2)

# Combine test and train data
m_data <- rbind(test_data, train_data)

colnames(m_data)[562: 563] <- c("Subject", "Activity")

# Get features
features <- getData('features')

# Apply Features as Column Names
m_colnames <- as.vector(features$V2)
colnames(m_data)[1:561] <- m_colnames

# Extract correct columns
ind <- grep("mean\\(\\)|std\\(\\)", m_colnames)
m_data <- m_data[, c(ind, 562, 563)]

# Get Averages
t_data <- aggregate(m_data, by=list(m_data$Subject, m_data$Activity), FUN=mean) 
t_data <- t_data[, 1:68, drop=FALSE]
colnames(t_data)[1:2] <- c("Subject", "Activity")

write.table(t_data, 'tidy_data.txt', row.names=FALSE)