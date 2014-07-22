##
# Recode values in excel file from old product categories to new MOJO craegories
# Assumes:
# Predictive Markets Norms Database with Star Calculator.xlsx is in data dir of working dir
# categoryMapping.csv is in working dir
# openxlsx libray is installed
# plyr library is installed

# Open data files
# Get excel library
library("openxlsx")
# Get plyr library
library("plyr")
# Open PM norms db
# Skip first 3 rows
data <- read.xlsx("data//Insights Database with Star Calculator.xlsx", sheet = 2, startRow = 2, colNames = TRUE,
                  skipEmptyRows = TRUE)

# Open file with values to recode
cats <- read.csv("categoryMapping.csv")

colnames(cats) <-  c("Lookup","MOJO")

cats <- subset(cats,select = c("Lookup","MOJO"))

## Pack test has smae colnames as PM so we can reuse same function

## Function recode PM data
# Arguments:
# data = PM dataframe
# oldvalue = vector of old values in PM dataframe
# newvalue = vector of new values in PM dataframe
recodePM <- function(data, oldvalue, newvalue) {
  
  # convert any factors to characters
  
  if (is.factor(data))     data     <- as.character(data)
  if (is.factor(oldvalue)) oldvalue <- as.character(oldvalue)
  if (is.factor(newvalue)) newvalue <- as.character(newvalue)
  
  # create the return vector
  
  newvec <- data
  
  # For each  
  for (i in unique(oldvalue)) {
    # Get new values from vector
    nv <- newvalue[oldvalue == i]
    # Replace MOJO values with nv, where Product.Area = oldvalue
    newvec$MOJO[ newvec[["(Old).Category"]] == i & !is.na( newvec[["(Old).Category"]] ) ] <- nv
  } 
  # Return recoded data
  newvec
}

# Call recode function
data <- recodePM(data, cats$Lookup, cats$MOJO)

# Remove .'s R automatically adds for spaces
colnames(data) <- gsub("\\.", " ", colnames(data))
# Save CSV file
write.csv(data, file = "recoded/insightMojo.csv", na = "", row.names = FALSE, fileEncoding = "UTF-8")

