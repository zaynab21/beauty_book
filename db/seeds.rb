require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
puts 'Cleaning database...'
TagRecipe.delete_all
IngredientRecipe.delete_all
Ingredient.delete_all
Tag.destroy_all
RecipePhoto.delete_all
Recipe.delete_all
User.destroy_all
Moderator.destroy_all
Tag.destroy_all

puts 'Creating users...'
hamid = User.create!(username: 'hamid', email: 'hamiddu93@yahoo.fr', password:"password")
hamida = User.create!(username: 'hamida', email: 'hamidadu93@yahoo.fr', password:"password")

puts 'Creating moderators...'
mode1 = Moderator.create!(password: 'hamidou', email: 'bossdu95@yahoo.fr' )

puts "Creating tags..."
moisturizing = Tag.create!(name: "Moisturizing")
acne = Tag.create!(name: "Acne")
dry = Tag.create!(name: "Dry skin")
oilys = Tag.create!(name: "Oily skin")
combination = Tag.create!(name: "Combination skin")
dryh = Tag.create!(name: "Dry hair")
oilyh = Tag.create!(name: "Oily hair")
normals = Tag.create!(name: "Normal skin")
normalh = Tag.create!(name: "Normal hair")
face = Tag.create!(name: "Face")
body = Tag.create!(name: "Body")
nail = Tag.create!(name: "Nail")
lips = Tag.create!(name: "lips")
coloring = Tag.create!(name: "Coloring")
treatment = Tag.create!(name: "treatment")
fall = Tag.create!(name: "Hair fall")


puts 'Creating recipes...'
Recipe.create!(state: "pending",  user_id: hamid.id,title: "Honey mask", category:'Dry skin', difficulty: 1, cost: 2, description: "Mix one tablespoon of raw honey or Manuka honey, 2 tablespoons of plain yogurt. Apply to face and let sit for 15-20 minutes. Use a warm washcloth to wipe off", tags: [moisturizing, face, dry])
Recipe.create!(state: "pending", user_id: hamid.id, title: 'Ghassoul body Wrap ', category: 'Body', difficulty: 1, cost: 1, description: "The ghassoul wrap is done by applying thin layers of warm ghassoul combined with argan oil on the whole body.
If you do it at home, in the palm of your hand, take the Rassoul and add some argan oil drop before application.
Make sure that the ghassoul is applied evenly over the skin.
Make sure that the ghassoul is applied evenly over the skin", tags: [oilys, body])
Recipe.create!(state: "pending", user_id: hamida.id, title: 'Henna with 30 herbs', category: 'Hair', difficulty: 3, cost: 2, description: "Put henna and sugar into a bowl and mix lemon juice and essential oils into the powder/sugar until you reach a thick mashed potato consistency. ...
Cover with plastic wrap, pressing the wrap down on top of the henna until it touches.
Set aside to await dye release.", tags: [coloring, dryh, treatment])

photo_urls = [
  "image/upload/v1525272112/hqjvti0zzzvfmxmz6dyk.jpg",
 "image/upload/v1525272114/gyx0idbio1exj9zlnk1c.png"
]

Recipe.find_each do |recipe|
  rp = RecipePhoto.new(recipe: recipe)
  rp.save(validate: false)
  rp.update_columns(photo: photo_urls[recipe.id % photo_urls.count])
end

puts 'Creating ingredients...'

filepath = "ingredients.csv"

CSV.foreach(filepath) do |row|
  Ingredient.create!(name: row.first)
end
puts 'Finished!'
