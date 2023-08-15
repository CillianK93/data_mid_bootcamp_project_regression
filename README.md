# Case study: Regression - House price prediction.

## Introduction:
The objective of the project was to explore and analyze the dataset to understand the factors responsible for high property value 650k and above, and also to build a machine learning model to predict house prices.

#### Contents of repository:
1. **Dataset** - Consists of information like No.of bedrooms, bathooms, floors, sqft and other characteristics on 22,000 properties sold in Seattle between May 2014 to May 2015.
2. **Sql queries** - Queries tasked to us relating to the database
house_price_regression.
3. **Tableau Dashboard** - Designed to be easy to use and give users the tools to analyze factors leading to a higher house price with an interactive map of Seattle.
4. **Jupyter Notebook** - Contains Python code which was used to first analyze our data and then build our machine learning model testing 3 different models.
5. **Presentation** - Our Slide show where we presented our findings from our analyze and our final machine learning model.

## Tableau:

Using Tableau enabled us to explore the factors related to the house prices in Seattle using various plots and techniques presented through an easy to use Dashboard.

- **Exploring the dataset:** We were able to compare median features of an average house compared to an average higher value house worth over 650k. Which lead us into some interesting insights and gave us direction when further delving into the problem at hand.

- **Interactive map for Zipcode analysis:** We created a map using the zipcodes given in our dataset, this allowed us to analyze the Urban, Suburban and Rural areas and the characteristics of houses they contain and the relevant price. Using filters on price and grade we were able to see the exact areas where our high value houses are located which was predominantly Suburban and inner city Urban areas.


- **Analysis of price and features of houses:** We used distribution plots and scatter plots to analyze what features were indicative of a high house price in our dataset. After exploring the various plots it was discovered that the Grade, No. of bedrooms, bathrooms and square footage of living area had significant impact on houses prices which is to be expected.

## Jupyter Notebook:

- **Data cleaning:** After the initial look at the dataset, we saw there was no nulls or incomplete sets. We decided to change some columns into objects that were categorical in nature which like bathrooms bedrooms etc.

- **EDA** 
1. **Distribution:** The distribution of the numerical columns were generally skewed to the right which is normal considering the values they represent either house features or price with outliers present.
The distribution of the categorical columns brought further understanding into what the average house in our dataset contained.
2. **Correlation:** Using a Correlation matrix we discovered high correlation between some of our columns which led us to remove two columns relating to square foot which contained the same info already present in another column.
3. **Outliers:** With a dataset of the housing market it was usual to see outliers which represented about 5% of our data.

- **Benchmark model:** We used three machine learning models LinearRegression, KNeighborsRegressor and MLPRegressor. With LinearRegression performing the best at the benchmark.

<img src='/images/Benchmark.png' width = 700>

- **Feature Engineering and Selection:**
- Exploring further the differences between sqft living/lot v sqft living15/lot15. The columns living15 and lot15 implied renovations which could mean they a



