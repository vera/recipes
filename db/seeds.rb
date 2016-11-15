# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create!([{
  name: "Breakfast"
},{
  name: "Dinner"
},{
  name: "Snacks"
}])

Ingredient.create!([{
  name: "Flour"
},{
  name: "Milk"
},{
  name: "Noodles"
},{
  name: "Brussels sprouts"
},{
  name: "Zucchini"
},{
  name: "Spinach"
},{
  name: "Potatoes"
}])

Recipe.create!([{
  name: "Pfannkuchen",
  picture: open(Rails.root + "app/assets/images/sample_picture_pfannkuchen.jpg"),
  category_id: 2,
  preparation_time: 10,
  ingredients: Ingredient.where(name: ['Flour', 'Milk'])
},{
  name: "Pasta with Brussels Sprouts",
  description: "And some other stuff.",
  picture: open(Rails.root + "app/assets/images/sample_picture_rosenkohl.jpg"),
  category_id: 2,
  ingredients: Ingredient.where(name: ['Noodles', 'Brussels sprouts'])
},{
  name: "Lasagna",
  description: "With tomato sauce, zucchini and spinach.",
  category_id: 2,
  picture: open(Rails.root + "app/assets/images/sample_picture_lasagna.png"),
  preparation_time: 70,
  ingredients: Ingredient.where(name: ['Noodles', 'Zucchini', 'Spinach'])
  },{
  name: "An apple",
  description: "Keeps the doctor away.",
  category_id: 1
},{
  name: "Baked potatoes with vegetables",
  description: "With a really long description: Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet.",
  category_id: 2,
  ingredients: Ingredient.where(name: ['Potatoes', 'Spinach']),
  picture: open(Rails.root + "app/assets/images/sample_picture_potatoes.jpg")
}])

testuser = User.new(
  email: "testuser@example.com",
  password: "secret"
)
testuser.skip_confirmation!
testuser.save!
