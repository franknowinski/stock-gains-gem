# Stock-Gains-Gem

This Ruby gem uses the Yahoo Finance API to provide three valuable stock market functions to the user. First, it imports the users portoflio from an external `CSV` file, calculates each stocks gain/loss for the day, then prints out the combined total. Next, it gives the user the option to display generic stock data of any or all of the stocks in their portfolio. Finally, it allows the user to lookup stock data regarding any stock of their choosing.  

# Installation

You can install this gem via `gem install stock-gains-cli-gem`. In order for this gem to work you'll need to clone this respository to your local computer. In the top level of the directory create a file called `portfolio.csv` and input the stock tickers followed by the number of shares you hold for each stock in your portfolio (Separate the two values by a comma and insert each stock on a  new line). Now run `stock-gains` to start the app. 
