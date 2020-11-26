# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Cleaning database..."
Ingredient.destroy_all
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients = JSON.parse(open(url).read)

puts "creating ingredients"
ingredients["drinks"].each do |ingredient|
  name = ingredient["strIngredient1"]
  Ingredient.create(name: name)
end
puts "finished"


mojito = Cocktail.create(name: "Mojito")

Dose.create(cocktail: mojito, ingredient: Ingredient.all.sample, description: "A spoon")
Dose.create(cocktail: mojito, ingredient: Ingredient.all.sample, description: "1 tblspn")
Dose.create(cocktail: mojito, ingredient: Ingredient.all.sample, description: "A shot")
Dose.create(cocktail: mojito, ingredient: Ingredient.all.sample, description: "A teaspoon")
Dose.create(cocktail: mojito, ingredient: Ingredient.all.sample, description: "50ml")


