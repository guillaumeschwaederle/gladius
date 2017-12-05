# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "-" * 50
puts "SEEDING GLADIUS STARTING"

User.destroy_all
Profile.destroy_all
Training.destroy_all
Serie.destroy_all
Exercice.destroy_all

require 'open-uri'
require 'nokogiri'
require 'faker'

categories = ["abdominaux", "pectoraux", "dos", "epaules", "biceps", "triceps", "avant-bras", "cuisses-fessiers", "mollets"]

names = []
descriptions = []

puts "Creating Exercises..."
categories.each do |category|
    name = ""
    description = ""

    url = "http://www.musculaction.com/exercices-#{category}.htm"
    html_file = open(url).read

    html_doc = Nokogiri::HTML(html_file)
        html_doc.search('h3').each do |element|
            name = element.text.strip
            names << name
        end
        html_doc.search('h3 + p').each do |element|
            description = element.text.strip
            descriptions << description
    end
    names.each_with_index do |name, index|
            Exercice.create!(name: names[index], category: category, description: descriptions[index])
    end
end

puts "Exercice Created !"
puts "__________________"

puts "Number of exercice created "
p names.size
puts "Number of description : "
p descriptions.size
puts "Number of category : "
p categories.size
puts "__________________"


puts "Creating Users..."
user = User.create!(
    email: "user@gmail.com",
    password: "123456"
)

profile = Profile.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user: user
)
profile.save!

n = 1
users = []
20.times do
    u = User.create!(
        email: "user#{n}@gmail.com",
        password: "123456"
    )
    users << u
    p = Profile.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user: u
    )
    n += 1
end
puts "number of User created :"
puts users.size
puts "Users Created !"
puts "__________________"
puts "SEED ENDED"
puts "-" * 50