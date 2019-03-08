# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# never run in production (development mode) because it erase existing data and setup new database
# based on seeds.rb
# only run at beginning

3.times do |topic|
    Topic.create!(
        title: "Topic #{topic}"
    )
end
puts "3 topics created!"

10.times do |blog| #blog is just an iterator : 0,1,2,....9
    Blog.create!(
        title: "post #{blog}",
        body: "some random blog text",
        topic_id: Topic.last.id 
    )
end
# print a msg to console
puts "10 blog posts created!"

5.times do |skill|
    Skill.create!(
        title: "Rails #{skill}",
        percent_utilized: 15
    )
end
puts "5 skills created!"

# https://place-hold.it/ to generate image & url
# also notice that cannot use '' instead of "" 
8.times do |portfolio_item|
    Portfolio.create!(
        title: "portfolio #{portfolio_item}",
        subtitle: "ruby on rails",
        body: "port ruby on rails text blablabla",
        main_image: "http://placehold.it/600x400",
        thumb_image: "http://placehold.it/350x200"
    )
end

1.times do |portfolio_item|
    Portfolio.create!(
        title: "portfolio #{portfolio_item}",
        subtitle: "angular",
        body: "port angular text blablabla",
        main_image: "http://placehold.it/600x400",
        thumb_image: "http://placehold.it/350x200"
    )
end

puts "9 portfolio items created!"

3.times do |technology|
    Portfolio.last.technologies.create!(
        name: "Technology #{technology}",
        portfolio_id: Portfolio.last.id
    )
end

puts "3 technologies created!"