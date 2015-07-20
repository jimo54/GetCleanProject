# GetCleanProject
## Included files
In addition to this README file, this repository contains
* An R script, named run_analysis.R, which produces the tidy data for Step #5 of the project from the raw data
* A codebook, named CodeBook.md, that describes the variables in my tidy data set

## The run_analysis.R script
The run_analysis.R script produces a tidy data set in the "narrow" format, one of the two options described in the project assignment. The dimensions of this data set are 11880 x 5, as described in the following discussion post from the course Web site: https://class.coursera.org/getdata-030/forum/thread?thread_id=86.
* The number of rows is based on 30 subjects performing 6 activites, including total of 66 mean and standard-deviation measurements for each. That's 30 * 6 * 66 = 11880.
* The five columns are subject, activity, feature, mean and std. This data provides summary data for each mean and std feature, grouped by each the subject and activity. 
* The 66 features were selected using a regular expression that matched only features that included the text 'mean() and std() in the feature labels. This matching produces the same number (33 each) of mean() and std() averages from among the measurements, which makes the most sense in my opinion. Several other feature names that include "mean" in their names, such as fBodyAcc-meanFreq()-X or fBodyAccJerk-meanFreq()-X do not appear to hold summary information, especially in that there is no matching standard deviation field for these measurements.

## Running the script
The run_analysis.R script assumes that the working directory is the top-level directory of the data after it is unzipped: UCI HAR Dataset. The script contains a single function, named run(), that loads data from the files in the data set and then subsets, reshapes and summarizes it to produce a tidy data set in "narrow" form. Once the script has produced the tidy data set, the data set is written to a file called summary_data.txt, in the working directory, and the first 10 lines of the data.frame are written to the console. The total time required is approximately 30 seconds on a 7-year old computer running Ubuntu 12.04. A sample run of the script is shown below.

> source('run_analysis.R')
> run()

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

The current working directory is:  /home/jim/Desktop/Getting and Cleaning Data/project/UCI HAR Dataset 

Source: local data frame [11,880 x 5]
Groups: subject, activity

   subject activity              feature        mean       std
1        1   LAYING    tBodyAcc-mean()-X  0.22159824 0.1689304
2        1   LAYING    tBodyAcc-mean()-Y -0.04051395 0.1186758
3        1   LAYING    tBodyAcc-mean()-Z -0.11320355 0.1740471
4        1   LAYING     tBodyAcc-std()-X -0.92805647 0.1229574
5        1   LAYING     tBodyAcc-std()-Y -0.83682741 0.3311775
6        1   LAYING     tBodyAcc-std()-Z -0.82606140 0.2885529
7        1   LAYING tGravityAcc-mean()-X -0.24888180 0.2202895
8        1   LAYING tGravityAcc-mean()-Y  0.70554977 0.2820544
9        1   LAYING tGravityAcc-mean()-Z  0.44581772 0.3883212
10       1   LAYING  tGravityAcc-std()-X -0.89683002 0.1873622
..     ...      ...                  ...         ...       ...

