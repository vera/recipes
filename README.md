# Recipes app

![Screenshot](/app/assets/images/screenshot_index.png?raw=true "Screenshot of the index page")

(Click to see more.)

This is a Ruby on Rails webapp to share recipes. Currently you can upload recipes with descriptions and pictures, display them, sort them and search through them. More to come!

Details:

* Built with Ruby on Rails

* Also uses HTML, CSS, Javascript

* Uses a SQLite database to store the recipes

* Uses Rspec for testing

* Based on the [Rails Girls Workshop Tutorial](http://guides.railsgirls.com/app)

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
