# Validate If the R packages required are available 
#   If not proceed to install them
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

# Load the R packages required
require("data.table")
require("reshape2")

# Data loading for activity labels
txt_file <- paste(getwd(), "UCI HAR Dataset/activity_labels.txt", sep = "/")
activity_labels <- read.table(txt_file)[,2]

# Data loading for data column names
txt_file <- paste(getwd(), "UCI HAR Dataset/features.txt", sep = "/")
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract only the measurements on the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", features)

# Load and process X_test & y_test data
txt_file <- paste(getwd(), "UCI HAR Dataset/test/X_test.txt", sep = "/")
X_test <- read.table(txt_file)
txt_file <- paste(getwd(), "UCI HAR Dataset/test/y_test.txt", sep = "/")
y_test <- read.table(txt_file)
txt_file <- paste(getwd(), "UCI HAR Dataset/test/subject_test.txt", sep = "/")
subject_test <- read.table(txt_file)

names(X_test) = features

# Filtering only the mean and standard deviation measurements.
X_test = X_test[,extract_features]

# Setting up for descriptive activity names
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Load and process X_train & y_train data.
txt_file <- paste(getwd(), "UCI HAR Dataset/train/X_train.txt", sep = "/")
X_train <- read.table(txt_file)
txt_file <- paste(getwd(), "UCI HAR Dataset/train/y_train.txt", sep = "/")
y_train <- read.table(txt_file)

# Read the subjects for train data
txt_file <- paste(getwd(), "UCI HAR Dataset/train/subject_train.txt", sep = "/")
subject_train <- read.table(txt_file)

# Set row names based in the features
names(X_train) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
X_train = X_train[,extract_features]

# Setting up the row names for train data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and train data
data = rbind(test_data, train_data)

# Create labels for the tidy data set with descriptive variable names
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data   = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

# Write the tidy data set as a txt file using write.table
txt_file <- paste(getwd(), "output_tidy_data.txt", sep = "/")
write.table(tidy_data, file = txt_file, row.name=FALSE, quote = FALSE)