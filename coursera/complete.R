complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  num<-formatC(id,width=3,flag=0)
  names<-sapply(1:length(num),function(i) paste(directory,"/",num[i],".csv",sep=""))
  
  #cat('num',num,'\n')
  #cat('names',names,'\n')
  
  nobs = numeric(length(num))

  
  for ( i in 1:length(num)){
    obs = 0
    file <- read.csv(names[i])
   # legt <- nrow(file)
  #  cat('legt', legt, '\n')
    
    for (j in 1:nrow(file)){
      if (is.na(file$nitrate[j])==FALSE & 
      is.na(file$sulfate[j])== FALSE){
      obs = obs+1
      }
    #cat('obs',obs,'\n')
    nobs[i]=obs  
    }    
  }
  
 dat<-cbind(id,nobs) 
  return (data.frame(dat))
 # return (nobs)
}