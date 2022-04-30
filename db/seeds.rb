# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts' Cleaning database'
Movie.destroy_all
puts 'Database clean'

url = 'http://tmdb.lewagon.com/movie/top_rated'
base_url = 'https://image.tmdb.org/t/p/original'

puts 'Seeding...'

1.times do |m|
  # To read each page of results (doesn't work on the lewagon version of tmdb)
  movies_serialized = URI.open("#{url}?page=#{(m + 1)}").read
  movies = JSON.parse(movies_serialized)['results']
  movies.each do |movie|
    puts "creating #{movie['title']}",
    Movie.create(
      title: movie['title'], # JSONs use strings not keys
      overview: movie['overview'],
      poster_url: base_url + movie['poster_path'], # Can interpolate
      rating: movie['vote_average']
    )
    puts "#{movie['title']} created"
    end
end

puts 'Done!'
