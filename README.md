# GetCleanProject
## Included files
In addition to this README file, this repository contains
* An R script, named run_analysis.R, which produces the tidy data for Step #5 of the project from the raw data
* A codebook, named CodeBook.md, that describes the variables in my tidy data set

## run_analysis.R
The run_analysis.R script produces a tidy data set in the "narrow" format, one of the two options described in the project assignment. The dimensions of this data set are 11880 x 5, as described in the following discussion post from the course Web site: https://class.coursera.org/getdata-030/forum/thread?thread_id=86.
* The number of rows is based on 30 subjects performing 6 activites, including total of 66 mean and standard-deviation measurements for each. That's 30 * 6 * 66 = 11880.
* The five columns are subject, activity, feature, mean and std. This data provides summary data for each mean and std feature, grouped by each the subject and activity. 
* The 66 features were selected using a regular expression that matched only features that included the text 'mean() and std() in the feature labels. This matching produces the same number (33 each) of mean() and std() averages from among the measurements, which makes the most sense in my opinion. Several other feature names that include "mean" in their names, such as fBodyAcc-meanFreq()-X or fBodyAccJerk-meanFreq()-X do not appear to hold summary information, especially in that there is no matching standard deviation field for these measurements.

