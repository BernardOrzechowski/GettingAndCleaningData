How to read and use content of this repository?
=========================

This repository consists of:  
  
1. run_analysis.R - R script that conducts data gathering, cleaning and transforming on the dataset described on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

2. CodeBook.md - an R code book file that describes the variables, data and transformations performed to clean up the data in more detailed fashion.

3. aggregated_measures.txt - tidy dataset output file, contains a data set with the average of each variable of type mean or standard deviation (2x33) for each activity and each subject. The size is therefore ((30 subjects x 6 activities) X (2x33 columns + subject column + activity column)), meaning 180 x 68  

4. aggregated_measures.xlsx - tidy dataset output file, as above, in different format  


EXAMPLE USAGE
=========================
```
      library(xlsx)
      data <- run_analysis()
      write.xlsx(data$aggregated_measures, "aggregated_measures.xlsx", col.names = TRUE, row.names = FALSE,showNA=FALSE)
```