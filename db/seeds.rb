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
Recipe.destroy_all
User.destroy_all
Moderator.destroy_all
Tag.destroy_all

puts 'Creating users...'
hamid = User.create!(username: 'hamid', email: 'hamiddu93@yahoo.fr', password:"password")
hamida = User.create!(username: 'hamida', email: 'hamidadu93@yahoo.fr', password:"password")

puts 'Creating moderators...'
mode1 = Moderator.create!(password: 'hamidou', email: 'bossdu95@yahoo.fr' )

puts "Creating tags..."
hydratant = Tag.create!(name: "Hydratant")
acné = Tag.create!(name: "Acné")
peau_seche = Tag.create!(name: "Peau séche")

puts 'Creating recipes...'
Recipe.create!(user_id: hamid.id,title: "Masque à l'orange", effect: 'nourishing', purpose:'dry hair', difficulty: 3, cost: 20, description: "nice shit", tags: [hydratant, peau_seche])
Recipe.create!(user_id: hamid.id, title: 'Cataplasme au citron', effect: 'moisturizing', purpose: 'normal skin', difficulty: 3, cost: 14, description: "very nice shit", tags: [hydratant, peau_seche])
Recipe.create!(user_id: hamida.id, title: 'Coloration au hénné',  effect: 'Anti-aging',   purpose: 'oily skin', difficulty: 2, cost: 6, description: "put the henna on the bowl", tags: [hydratant, peau_seche])
puts 'Finished!'

puts 'Creating ingredients...'

filepath = "seed_ingredient.csv"
csv_options = { col_sep: ',', quote_char: '"' }

CSV.foreach(filepath, csv_options) do |row|
  Ingredient.create!(name: row.first)
end
puts 'Finished!'
