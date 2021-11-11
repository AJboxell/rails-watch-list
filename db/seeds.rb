# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies["results"].each do |film|
  movie = Movie.new(title: film["original_title"], overview: film["overview"], poster_url: "https://image.tmdb.org/t/p/w500#{film["poster_path"]}", rating: film["vote_average"])
  puts "Adding #{film["original_title"]}..."
  movie.save!
end
puts "Done"
