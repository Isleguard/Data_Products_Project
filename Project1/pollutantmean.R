pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ###################################################################
  #  safety check of pollutant name
  ###################################################################
  if ( (pollutant != "sulfate") & (pollutant != "nitrate")){
    print (" The pollutant doesn't match.  Please use either 'sulfate' or 'nitrate'/n")
    exit
  }
  ####################################################################
  # change to the working directory and get a list of available files
  ####################################################################
  dir1<-"h:/RStudio-Projects/Project1/"   #local directory offset 
  dir2<-directory
  dir_save<-getwd()                   ### get the current working directory
  dir4<-paste(dir1,dir2,sep="")       ### combine the two here
  
  #######################################   
  ### Change directory and get file list
  #######################################
  setwd(dir4)
  files<-dir()
  
  #  debug:  print (files)
    
  ##############################################################
  ### open/read the file
  ##############################################################
  #  First. Convert the file vector to a list of filenames
  #  len<-length(id)
  filename <-sprintf("%03d",id)
  filename1=paste(filename,".csv",sep="")
  #  debug:   print(filename1)
  #################################
  # concatenate all files to one large for processing
  for(i in seq_along (filename1)) {
    data<-read.table(filename1[i],header=TRUE,sep=",")  ##  Note only 1 element of the vector read
    if (i == 1){
      write.table(data,file="catdata.csv",col.names=TRUE,row.names=FALSE,sep=",")
    }
    else{
      write.table(data,file="catdata.csv",col.names=FALSE,row.names=FALSE,sep=",",append=TRUE)
    }
  }    
    ##########################################################
    #  Above is the base code for all the other assignments
    #  It does all file name gathering and conversions needed
    ##########################################################
    #   debug:   print (data)
    ##########################################################      
    ########################################################
    # Data gathering complete, pollutant name check passes
    # now perform the calculation
    ########################################################
    # read the concatenated file 
    massive<-read.table("catdata.csv",header=TRUE,sep=",") 
    #rm ("catdata.csv")         #remove the file as unneeded anymore
    vector1<- massive[[pollutant]]    # extract the vector of the pollutant
      #  debug:   print (vector1)
    vector2<- is.na(vector1)
      #  debug:   print (vector1)
    vector3<- vector1[!vector2]       # extract only the filtered data
      #  debug:   print (vector3)
    value <- mean (vector3)
    #value1<- sprintf( "%1.3f", value)
    value

}