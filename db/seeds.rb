# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "-" * 50
puts "SEEDING GLADIUS STARTING"

Serie.destroy_all
Exercice.destroy_all
Training.destroy_all
Profile.destroy_all
User.destroy_all

require 'open-uri'
require 'nokogiri'
require 'faker'

# Seeds des Exercices

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



# Seeds des Users

puts "Creating Users..."
user = User.create!(
    email: "user@gmail.com",
    password: "123456"
)

profile = Profile.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user: user
)

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

puts "Creating Admin users..."

admin_user = User.create!(
        email: "guillaume@gmail.com",
        password: "123456",
        admin: true
)
    Profile.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user: admin_user
)


puts "number of User created :"
puts users.size
puts "Users Created !"
puts "__________________"
puts "SEED ENDED"
puts "-" * 50



############# Seeds Training + séries
e = Exercice.first(5)
p e
# Training done
rep = 1
puts "Start Training done creation"
10.times do
  t = Training.create!(
    name: "Programme fait#{rep}",
    profile: Profile.first
  )
  srep = 0
  puts "Start Serie creation"
  5.times do
    series_done = Serie.create!(
      goal: 100,
      done: 90,
      exercice: e[srep],
      training: t
    )
    srep += 1
  end
  puts "End Serie creation"
  rep += 1
end
puts "End Training done creation"


# Training midlle (done & not done)

rep = 1
puts "Start Training creation"
10.times do
  t = Training.create!(
    name: "Programme middle #{rep}",
    profile: Profile.first
  )
  srep = 0
  puts "Start Serie creation"
  5.times do
    series_done = Serie.create!(
      goal: 100,
      done: 90,
      exercice: e[srep],
      training: t
    )
    series_not_done = Serie.create!(
      goal: 100,
      exercice: e[srep],
      training: t
    )
    srep += 1
  end
  puts "End Serie creation"
  rep += 1
end
puts "End Training middle creation"


# Training not done

rep = 1
puts "Start Training creation"
10.times do
  t = Training.create!(
    name: "Programme pas fait #{rep}",
    profile: Profile.first
  )
  srep = 0
  puts "Start Serie creation"
  5.times do
    series_done = Serie.create!(
      goal: 100,
      exercice: e[srep],
      training: t
    )
    srep += 1
  end
  puts "End Serie creation"
  rep += 1
end
puts "End Training not done creation"





# Decoration Seeds

puts "                ````````
            `-oydNMMMMNdy:
          -smMMMMNN NMMMm-
        `oNMM dho d ::/o-
        oMMmyy mshs:-.`    .-`          `-.       `-----.`      .-`   `-.     .-`    `.---.`
        m m h enculé!!/    hN.         `hmN/      :Ndyyyhhy:    oM/   -My     yM-   :ddyyhho
        NMoy hM/`    .`    dM.        `hN-yN:     /Ms   `.yN/   oM/   -My     yM:   sMh:.`.`
        sMo``NN`   :hhy    dM.       `yN/..dN:    /Ms     -Mh   oM/   -My     yM-   `/syhdh/
        .Nd  +Nh:.`.:mm    dM.      `sNdyyyhmm-   /Ms   `:dN:   oM/   `mm-` `-mN.  `+:.``:NN.
         my   .oyhhhys/    hNdhhhs  +m+`````.dd.  :Nmhhhhyo.    oN/    -shdhdhs-   `oyddddh/
       `/y`     `````      ```````  ``       ```  ````````      ```      `````       ``````
        `
"
