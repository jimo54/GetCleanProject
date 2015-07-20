## First, load the libraries we need
## to produce the tidy data set
library(dplyr)
library(reshape2)

# Read in feature and activity labels
features<-read.table('features.txt',stringsAsFactors=FALSE)
labels<-read.table('activity_labels.txt',stringsAsFactors=FALSE)

# Read in the train subject and activities data
train_subject<-read.table('train/subject_train.txt')
train_y<-read.table('train/y_train.txt')

# Replace activities numeric values with matching character labels
for(i in 1:6) {
   train_y[train_y[,1]==labels[i,1],]<-labels[i,2]
}

# Read in the train measurement data and 
# bind the subject and activities columns to it
train_x<-read.table('train/X_train.txt')
train<-cbind(train_subject, train_y, train_x)

# Read in the test subject and activities data
test_subject<-read.table('test/subject_test.txt')
test_y<-read.table('test/y_test.txt')

# Replace activities key values with matching descriptive labels
for(i in 1:6) {
   test_y[test_y[,1]==labels[i,1],]<-labels[i,2]
}

# Read in the train measurement data and 
# bind the subject and activities columns to it
test_x<-read.table('test/X_test.txt')
test<-cbind(test_subject, test_y, test_x)

# Now bind the two data sets together
dataset<-rbind(train,test)

# Set the names for all the variables
names(dataset)<-c('subject','activity',features[,2])

# Keep only the measurements on the mean and 
# standard deviation for each measurement. 
dataset<-dataset[,grep('subject|activity|mean\\(\\)|std\\(\\)', colnames(dataset))]

# Sort the data by subject and then activity
dataset<-arrange(dataset, subject, activity)

# And, now, for Step #5!
## First, melt the dataset into rows based on subject and activity,
## using the reshape2 library's melt function
melted_data<-melt(dataset,id.vars=c('subject','activity'),variable.name='feature')

## Next, group the melted data by subject, activity and feature
##  using the dplyr library's group_by function
grouped_data<-group_by(melted_data, subject, activity, feature)

## Finally, summarise() the grouped data to show the
## mean and std for each feature, by subject and activity...
summary_data<-summarise(grouped_data, mean=mean(value), std=sd(value))

## ...and, write it to a file in the working directory
write.table(summary_data,'summary_data.txt', row.name=FALSE)


