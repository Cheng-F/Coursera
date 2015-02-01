##create a temporary file to store download data.

temp<- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)

## read train and test data and features as data.table
dataxt<-read.table(unz(temp,"UCI HAR Dataset/test/X_test.txt"))
datayt<-read.table(unz(temp,"UCI HAR Dataset/test/y_test.txt"))
datast<-read.table(unz(temp,"UCI HAR Dataset/test/subject_test.txt"))
dataxta<-read.table(unz(temp,"UCI HAR Dataset/train/X_train.txt"))
features<-read.table(unz(temp,"UCI HAR Dataset/features.txt"))

##unlink temp file
unlink(temp)

##merge train and test datasets
dataxall<-merge(dataxt,dataxta,all=T)
#datayall<-merge(datayt,datayta,all=T)  3645552*1 ?
datayall<-rbind(datayt,datayta)

##use regular expression to extract only 
##mean and deviation measurements.
ind<-grep("(mean|std)\\(\\)",features[,2])
datax_m_s<-dataxall[,ind]

