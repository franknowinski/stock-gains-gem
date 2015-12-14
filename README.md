## Stock-Gains-Gem

This Ruby gem uses the Yahoo Finance API to provide three valuable stock market functions for the user. First, it imports the users portoflio from an external `CSV` file, calculates each stocks gain/loss for the day, then prints out the combined total. Next, it gives the user the option to display generic stock data of any or all of the stocks in their portfolio. Finally, it allows the user to lookup stock data regarding any stock of their choosing.  

## Installation

You can install this gem via `gem install stock-gains-gem`. Before you run this app you'll need to set up a `CSV` file containing all of the stocks in your portfolio so they can be imported into the app. Start by cloning the respository to your local computer. Then on the top-level of the folder create a file called `portfolio.csv` and insert the stock ticker followed by the number of shares you hold for each stock in your portfolio (separate the two values by a comma and input each stock on a new line). Now run `stock-gains` to start the app. 

![](csv.jpeg)

## Usage

## Development 
After checking out the repo, run `bundle exec bin/setup` to install dependencies.

## License 

The gem is available as open source under the terms of the MIT License.
