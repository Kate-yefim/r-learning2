library(dplyr)
library(stringr)
library(tidyverse)

train_set <- read.table("C:/Users/Katya/Desktop/UCI HAR Dataset/train/X_train.txt")
test_set <- read.table("C:/Users/Katya/Desktop/UCI HAR Dataset/test/X_test.txt")
merged_data <- rbind.data.frame(train_set, test_set)

all_features <- read.table("C:/Users/Katya/Desktop/UCI HAR Dataset/features.txt")

needed_features_id <- all_features[str_detect(all_features$V2, "mean")|str_detect(all_features$V2, "std"),1]

mean_std_from_all <- merged_data[, needed_features_id]

labels_train <- read.table("C:/Users/Katya/Desktop/UCI HAR Dataset/train/y_train.txt")
labels_test <- read.table("C:/Users/Katya/Desktop/UCI HAR Dataset/test/y_test.txt")

labels_train$V1 <- as.factor(labels_train$V1)

levels(labels_train$V1) <- c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')

labels_test$V1 <- as.factor(labels_test$V1)

levels(labels_test$V1) <- c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')


whole_labeled <- rbind.data.frame(labels_train, labels_test)

means_names <- as.character(all_features[str_detect(all_features$V2, "mean")|str_detect(all_features$V2, "std"),2])

names(mean_std_from_all) <- means_names

subject_train <- read.table("C:/Users/Katya/Desktop/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("C:/Users/Katya/Desktop/UCI HAR Dataset/test/subject_test.txt")
subject_data <- rbind.data.frame(subject_train, subject_test)

temp <- cbind.data.frame(subject = subject_data$V1, activity = whole_labeled$V1, mean_std_from_all)

temp2 <- group_by(temp, subject, activity)

tidy_dataset <- summarise_all(temp2, mean)

write.table(tidy_dataset, file = "C:/Users/Katya/Desktop/tidy_dataset.txt", row.names = FALSE)
