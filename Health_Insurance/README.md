# Health Insurance Analysis

This repository contains code that performs an analysis on health insurance data to gain insights into the factors influencing charges. The dataset, loaded from 'insurance.csv', is explored and visualized to uncover relationships between various attributes and insurance charges. Additionally, a linear regression model is built to predict charges and identify significant attributes.

## Getting Started

To begin the analysis, follow these steps:

1. **Load Data**: The 'insurance.csv' dataset is read into the R environment using the `read.csv()` function with headers.

2. **Numeric Columns**: Identify and isolate the numeric columns in the dataset using the `is.numeric()` function and create a plot to visualize these columns.

3. **Correlation Analysis**: Compute the pairwise correlations between numeric columns using the `cor()` function. The results are rounded to two decimal places.

4. **Charges by Attributes**: Explore charges based on categorical attributes like 'smoker', 'sex', and 'region' using box plots.

5. **Linear Regression**: Build a linear regression model (`model1`) to predict charges based on all available attributes. View the summary of the model to identify significant attributes.

## Analysis Steps

Follow these steps to perform the analysis:

1. **Numeric Columns**: Understand the distribution and relationships of numeric columns by visualizing them in a plot. This step provides a preliminary overview of the data.

2. **Correlation Analysis**: Examine the correlation matrix to identify potential relationships between numeric attributes. Correlation coefficients provide insight into the strength and direction of linear relationships.

3. **Charges by Attributes**: Visualize how insurance charges vary with categorical attributes using box plots. This step helps identify potential differences in charges based on different groups.

4. **Linear Regression**: Build a linear regression model (`model1`) to predict charges. The summary of the model provides information about the significance and effect sizes of individual attributes.

## Conclusion

The analysis of health insurance data reveals valuable insights into the factors influencing insurance charges. The linear regression model indicates that approximately 75% of the variance in charges can be explained by the model. Among the important attributes are age, sex, BMI, number of children, and smoking status. This information can assist in understanding and predicting insurance charges based on individual characteristics.
