# US Colleges Data Analysis

This project utilizes ggplot and a Linear Regression Model to address the following questions related to US colleges data:

1. Do colleges with larger full-time enrollments have lower graduation rates?
2. Is this relationship different for public and private institutions?
3. How does selectivity impact graduation rates?

## Know the Dataset

To familiarize ourselves with the dataset, the code starts with accessing the documentation for the 'College' dataset and using `glimpse()` to display an overview of its structure.

## Exploratory Graphics

Initial data exploration involves creating a histogram of graduation rates using ggplot. An outlier is noted.

## Analysis for Question 1

### Do colleges with larger full-time enrollments have lower graduation rates?

A scatter plot between full-time undergraduate enrollments and graduation rates is created, with enrollments in base 10 logarithmic scale. A sub-dataframe 'college_sm' is generated for the analysis. A linear regression model is fitted and summarized, indicating a lack of significant relationship.

## Analysis for Question 2

### Is this different for public and private institutions?

Another scatter plot is generated, this time differentiating between public and private institutions using color. A linear regression model is fitted and summarized, revealing a significant difference between private and non-private colleges in terms of graduation rates.

## Analysis for Question 3

### If it is different for more selective schools?

The impact of selectivity, as represented by the top 25% of institutions, is analyzed. A linear regression model is fitted and summarized, showing a significant relationship between selectivity, institution type (private/public), and graduation rates.

## Summary

In conclusion, this analysis explores the relationships between graduation rates, full-time enrollments, institution type (public/private), and selectivity. The results suggest that graduation rates are influenced by the institution's private/public status and selectivity, while the relationship between graduation rates and full-time undergraduate enrollments is not statistically significant.

Please note that this summary provides a concise overview of the analysis, focusing on the key findings and methodology. Additional exploration and contextual information may be necessary for a comprehensive understanding.
