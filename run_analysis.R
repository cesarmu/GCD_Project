MergeFiles <- function ()
{
 library(tidyr) 
  

 #Load files  
 x_testData = read.table("./test/X_test.txt")
 y_testData = read.table("./test/Y_test.txt")
 
 x_trainData = read.table("./train/X_train.txt")
 y_trainData = read.table("./train/Y_train.txt")
 
 x_bindData = rbind(x_testData, x_trainData)
 y_bindData = rbind(y_testData, y_trainData)
 
 featuresData <- read.table("features.txt")
 

 mean_and_std_features <- grep(("mean|std"), featuresData[, 2])
 
 x_bindData <- x_bindData[,mean_and_std_features]
 
 
 names(x_bindData) <- featuresData[mean_and_std_features, 2]
 #mean_std_Data <- featuresData[mean_and_std_features,2]
 
 #featuresData <- x_bindData[ ,mean_and_std_features]
 
 #names(x_bindData) <- featuresData[mean_and_std_features, 2]
 ##mean_std_Data <- featuresData %>%
##                  select() %>%
##                  filter() %>%
##                  head(n=20) %>%
##                  print
# #head(featuresData, n=10)
head(x_bindData, n = 10)

# Step 3
# Activity names
###############################################################################

activitiesData <- read.table("activity_labels.txt")

# update values with correct activity names
y_bindData[, 1] <- activitiesData[y_bindData[, 1], 2]

head(y_bindData, n=10)
# correct column name
names(y_bindData) <- "activity"

# Step 4
# Change dataset variable names



# bind all the data in a single data set
all_data <- cbind(x_bindData, y_bindData)#, subject_data)

# Step 5
###############################################################################

write.table(all_data, "averages_data.txt", row.name=FALSE)

 
}