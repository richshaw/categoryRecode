## MOJO Recode scripts

# Overview 

Scripts will: 

* Load the corresponding sheet from the relavant XLSX file. 
* Replace or create a new column called "MOJO"" which contains values based on the first two columns in "categoryMappings.csv"
* Saves recoded data to CSV file in recoded directory
* Have to hand copy CSV data into excel file because doing in programatically breakes Excel formatting

# Usage

Each excel file has it's own script because they are each formatted differently. Each script corresponds to one Excel file. E.g. recodePM.R is for "data//Predictive Markets Norms Database with Star Calculator.xlsx".

To run script:

````
source("recodeInsight.R")
````

To copy the new CSV data into the excel file:

* Open excel file
* Go to menu Data > Get External Data From Text
* Select CSV file in recode directory and click Import
* Set file type to Delimited
* Choose 65001: Unicode (UTF-8) from the drop-down list that appears next to File origin
* Click on the Next button to display the Text Import Wizard - Step 2 or 3 window
* Place a checkmark next to the comma delimiter
* Click on the Next button to display the Text Import Wizard - Step 3 of 3
* Leave all column formats as General
* Click on the Finish button
* Select Add to new worksheet

# Ouput

Scripts out CSV files in the recoded directory.

The final outputs with MOJO categories in the Excel files can be found in final directory.

# Notes

"data/Brand Database with Star Calculator.xlsx" does not have a script or final file because it doesn't have any categories to recode. 
"categoryMappings.csv" contains a third column called "New MOJO category needed". All rows with a value of 1 need new categories creating in MOJO.
