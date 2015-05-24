# Getting and Cleaning Data: Course Project

## Introduction

As a part of the Coursera course "Getting and Cleaning data", this is my completed work. The aim of the project is to combine data and create a tidy dataset

## Raw Data

The training and test data essentially hold similar data. The features are found in the x_test.txt and are unlabeled. The activity labels are in the y_test.txt file. The test and train subjects are in the subject_test.txt & subject_train.txt files respectively.

## run_analysis.R Script

The script run_analysis.R which will merge the test and training sets together. Before the script is run the UCI HAR Dataset is extracted and saved in the UCI_HAR_Dataset directory in the working directory.
After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.
Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

## Code Book

The CodeBook.md file details the transformations performed and the resulting data and variables.
