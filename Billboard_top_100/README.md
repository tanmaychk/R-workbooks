# Billboard Songs Analysis

This code explores the cheerful factor (valence) of top songs on the Billboard chart. The hypothesis under investigation is whether songs that reach the number 1 position on the chart are more cheerful in terms of their valence score, indicating greater positivity. The analysis involves utilizing data from the 'billboard' and 'audio_features' datasets obtained through the 'tidytuesdayR' package.

## Getting Started

1. Load the required libraries: `tidyverse` and `tidytuesdayR`.
2. Fetch the 'billboard' and 'audio_features' datasets using `tt_load()` function from `tidytuesdayR` for the specified date.
3. Preprocess the 'billboard' data by extracting peak positions and week IDs, then filter for unique song IDs with number 1 status.
4. Join the 'audio_features' dataset with the filtered 'billboard' data based on song IDs.

## Analysis Steps

1. Examine missing data: Calculate the proportion of missing values in the 'valence' variable. Approximately 17.5% of the data is missing, deemed acceptable for the analysis.
2. Visualization: Create a box plot comparing valence scores of number 1 songs and non-number 1 songs using `ggplot`.
3. Hypothesis Testing: Perform a two-sample t-test, assuming unequal variances, to assess the statistical significance of the difference in valence between the two groups.
4. Interpretation: The analysis suggests that number 1 songs tend to have a slightly higher valence or cheerfulness compared to non-number 1 songs. Cohen's d is calculated to measure the effect size, indicating a very small difference.

## Conclusion

This analysis provides insights into the emotional characteristics of top Billboard songs, indicating a subtle difference in cheerfulness between number 1 songs and others. The small effect size implies that while there is a statistically significant difference, it is not practically substantial.
