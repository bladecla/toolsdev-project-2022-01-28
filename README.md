# Tools Dev Project 2022-01-28
## Project Overview

Fork the provided default Rails app, use a postgres db to display Highstock charts of the local Austin temperatures. Properly allocate the assets and route the internal API requests through the rails stack and display live data on the frontend using AJAX. API endpoints will be provided by us. Push the changes to a feature branch, create a pull request and deploy to Heroku.

We want to see you working with Rails models and the database, so be sure that you’re not writing this entirely in Javascript.

The due date for this project is 9:59AM CST 2022-02-07. Your pull request should not have any commits made after this time. The pull request should be submitted by 12:00PM CST 2022-02-07.

## INSTRUCTIONS

1. Fork the primary repo at [https://github.com/bc-RoryRegnell/toolsdev-project-2022-01-28](https://github.com/bc-RoryRegnell/toolsdev-project-2022-01-28) and create a new feature-branch to work on
2. Use Bootstrap ([http://getbootstrap.com](http://getbootstrap.com)) for styling
3. Use Highstock gem ([https://github.com/bc-RoryRegnell/highstock-rails](https://github.com/bc-RoryRegnell/highstock-rails)) for charting
4. Set favicon and logo. Link logo to [http://www.bigcommerce.com](http://www.bigcommerce.com)
5. Route assets appropriately
6. Store temperature data for Lat 30.404251, Long -97.849442 (Our Austin HQ location) from [https://www.worldweatheronline.com/developer/api/](https://www.worldweatheronline.com/developer/api/) in a postgres database using Rails. Creating a new account with them gives a 60 day trial for historical data, no payment or CC info necessary.
7. Backfill 1 month of data.
8. Update intervals as they occur with actual temperatures instead of forecasts using a Rails job. Hint: Clockwork
9. Display 2 Charts on a page showing the same data in different ways
    1. Historical temperatures and 2 days of forecast in separate series, in intervals of 1 hour
    2. Historical highs and lows, in 3-hour intervals
10. The charts should update with updated data every 30 minutes. The page itself should not refresh.
11. The page should be mobile responsive and scale to the width of the screen.
12. Compile assets
13. Deploy to Heroku.
14. Don’t push to github until the indicated time above, we don’t want you sharing code and giving someone else a leg up. Push to the feature-branch on your fork and make a pull request on my primary repo for your commit(s) so I can review it. Make sure the pull request has a link to your Heroku app running the code.

## Example

This is an example that meets all of the above requirements, some of the extra credits, was completed in less than a single workday and is currently running on Heroku. It is in the form of screenshots so as to ensure the code can not be peeked into to give anyone an advantage: [https://imgur.com/a/J6F6CyA](https://imgur.com/a/J6F6CyA)
## Resources

* Logo Asset - [https://imgur.com/a/samQgr0](https://imgur.com/a/samQgr0)
* Github account - [https://github.com/](https://github.com/)
* Heroku account - [https://heroku.com/](https://dashboard.heroku.com/)
* [http://getbootstrap.com](http://getbootstrap.com)

## Best Practices and expectations:

* Use Ruby 2.6.4, Rails 5.2.5
* Use Coffeescript preprocessor for JS
* Make sure you’re not committing any API keys or DB credentials to your repo
* Don’t forget to periodically test on your Heroku instance while developing. The asset pipeline can be tricky!
## Extra Credit

So, you’re an overachiever and want to show off what you can do? Try these things or be creative and come up with your own ideas on how to add extra functionality, utility, or a little flair:


* Thoroughly document your code
* Write some tests
* Add custom zoom buttons on the charts. There should be a custom Cd/Current Day button that zooms the chart to the current day.
* Use an additional Highchart/Highstock chart type to display the data in a unique way that adds value by making it more readable, more user friendly, or helps show trends, changes, or outliers.
* Your pull request is detailed and descriptive

## Considerations

_____  Is the App accessible from the internet?

_____  How well does the app work?  (1 = mockup with no actual functionality / 10 = All buttons and actions work flawlessly)

_____ Was the project completed on time?

_____ Does it work on a Phone?

_____ Overall Design of the page.  Is it easy to read and see the data?

_____ Were the best practices and expectations followed?

_____ Extra Credit.  Go above and beyond for the WOW factor that gives the end user an awesome experience.
