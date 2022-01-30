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


['video', 'articulo', 'paper', 'red social', 'foto'].each do |k|
    Type.create(name: k)
end

#categories
my_anime = Category.create(name: 'Anime', private: false)
my_peliculas = Category.create(name: 'Peliculas', private: false)

my_anime_shonen = Category.create(name: 'Shonen', private: false, category_id: my_anime.id)
my_anime_isekai = Category.create(name: 'Isekai', private: false, category_id: my_anime.id)

my_peliculas_ficcion = Category.create(name: 'Ficcion', private: false, category_id: my_peliculas.id)
my_peliculas_comedia = Category.create(name: 'Comedia', private: false, category_id: my_peliculas.id)

20.times do
    Bookmark.create(
           url: Faker::Internet.url,
           type_id: rand(1..5),
           category_id: rand(1..12)
    )
end