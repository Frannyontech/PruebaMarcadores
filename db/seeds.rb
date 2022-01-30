# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Type.destroy_all
Category.destroy_all
Bookmark.destroy_all


['video', 'articulo', 'paper', 'red social', 'foto'].each do |v|
    Type.create(name: v)
end

#categories
my_animales = Category.create(name: 'Animales', private: false)
my_peliculas = Category.create(name: 'Peliculas', private: false)

my_animales_mamiferos = Category.create(name: 'Mamiferos', private: false, category_id: my_animales.id)
my_animales_peces = Category.create(name: 'Peces', private: false, category_id: my_animales.id)

my_peliculas_terror = Category.create(name: 'Terror', private: false, category_id: my_peliculas.id)
my_peliculas_comedia = Category.create(name: 'Comedia', private: false, category_id: my_peliculas.id)

20.times do
    Bookmark.create(
           url: Faker::Internet.url,
           category_id: rand(1..12)
    )
end