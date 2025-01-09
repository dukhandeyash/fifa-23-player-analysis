# FIFA 23 Player Data Analysis

This project involves an analysis of the FIFA 23 player dataset, focusing on player characteristics, club performance, and league statistics. The dataset provides detailed information about over 18,000 football players, including their attributes, positions, club information, and market values. The analysis includes data cleaning, exploratory data analysis (EDA), and data visualization to uncover insights about football players from around the world.

## Project Overview

This project uses the **FIFA 23 Complete Player Dataset** to analyze and visualize various football-related statistics. The analysis covers the following key aspects:

1. **Data Cleaning and Transformation**
   - Transformation of categorical variables into continuous variables.
   - Mapping of players to their respective leagues and countries.
   - Handling missing values and variable renaming.

2. **Exploratory Data Analysis (EDA)**
   - Introduction and structure of the dataset.
   - Identification and visualization of missing data.
   - Aggregation of market values for each football league.

3. **Visualization**
   - Plotting league market values using bar charts.
   - Mapping the number of players per nationality using geographical maps.
   - Comparing various player attributes by class (e.g., Goalkeepers, Defenders, Midfielders, Forwards) in the Premier League.

4. **Correlation Analysis**
   - Analyzing the relationship between key attributes like "Shot Power" and "Finishing" for forwards in La Liga.

## Dataset

The dataset used in this project is from Kaggle and is publicly available [here](https://www.kaggle.com/datasets/javagarm/fifa-19-complete-player-dataset). It contains detailed information on FIFA 23 players, such as:

- Player names
- Positions
- Market values
- Wages
- Nationalities
- Club information (including league and country)

## Key Libraries

- `tidyverse`: A collection of R packages for data manipulation and visualization.
- `magrittr`: For pipe operations.
- `DataExplorer`: For automatic exploratory data analysis.
- `maps`: For geographic mapping.
- `plotly`: For interactive visualizations.
- `DT`: For displaying data tables in HTML.
- `tidytext`: For text analysis.
- `factoextra`: For visualizing and evaluating clustering results.

## Installation

To get started, you'll need to install the following R libraries:

```r
install.packages(c("tidyverse", "magrittr", "DataExplorer", "maps", "plotly", "DT", "tidytext", "gridExtra", "factoextra"))
