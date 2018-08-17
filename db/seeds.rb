# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

puts 'Open & parse Json...'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
file = open(url).read
result = JSON.parse(file)
ingredients = result['drinks']

puts 'Create Ingredients...'
ingredients.each do |ingredient|
  Ingredient.create(name: "#{ingredient['strIngredient1']}")
end

puts 'Finished!'

puts 'Create Cocktails...'
Cocktail.create(name: 'Mojito')
Cocktail.create(name: 'Sex on the Beach')
Cocktail.create(name: 'Tequila Sunrise')
Cocktail.create(name: 'Pina Colada')
Cocktail.create(name: 'Punch Planter')
Cocktail.create(name: 'Bloody Mary')

puts 'Finished!'
