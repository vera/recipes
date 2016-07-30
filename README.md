# Recipes app

![Logo](/app/assets/images/logo.png?raw=true "Logo")

This is a Ruby on Rails webapp to share recipes. Currently you can upload recipes with descriptions and pictures, display them, sort them and search through them. More to come!

Details:

* Built with Ruby on Rails

* Also uses HTML, CSS, Javascript

* Uses a SQLite database to store the recipes

* Uses Rspec for testing

* Based on the [Rails Girls Workshop Tutorial](http://guides.railsgirls.com/app)

## Screenshots

**Take a closer look: Click to zoom!**

![Screenshot](/app/assets/images/screenshot_index.png?raw=true "Screenshot of the index page")

The index page displays the three newest recipes in each category.

![Screenshot](/app/assets/images/screenshot_new_recipe.png?raw=true "Screenshot of the New Recipe page")

You can upload new recipes with a picture and a description.

![Screenshot](/app/assets/images/screenshot_search.png?raw=true "Screenshot of the search page")

You can search through uploaded recipes and filter by category and/or name.

## Installation

Clone repository:

`git clone https://github.com/veracl/recipes.git`

Change into directory and install gems:

`cd recipes`

`bundle install`

## Run the app

Run migrations and seed the database:

`bundle exec rake db:migrate`

`bundle exec rake db:seed`

Start the server:

`bundle exec rails server`

**Done!** Open your browser and check it out. You can now make your own changes. Reset the database at any time with:

`bundle exec rake db:reset`
