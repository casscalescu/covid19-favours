require "open-uri"
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Clear old data

puts 'Clearing Favour Applications...'
FavourApplication.destroy_all if Rails.env.development?

puts 'Clearing Reviews...'
Review.destroy_all if Rails.env.development?

puts 'Clearing Favours...'
Favour.destroy_all if Rails.env.development?

puts 'Clearing Users...'
User.destroy_all if Rails.env.development?


# Seed new data

puts 'Creating Users...'
nikolai = User.create!(
  first_name: "Nikolai",
  last_name: "Pammer",
  mobile: "0444 123 123",
  address: "1 Collins Street, Melbourne, 3000, VIC",
  email: "nikolai@user.com",
  password: "password",
  password_confirmation: "password"
)
file = URI.open("https://source.unsplash.com/featured/?man")
nikolai.photo.attach(io: file, filename: 'nikolai.png', content_type: 'image/png')

cassandra = User.create!(
  first_name: "Cassandra",
  last_name: "Calescu",
  mobile: "0444 000 000",
  address: "1 Flinders Street, Melbourne, 3000, VIC",
  email: "cassandra@user.com",
  password: "password",
  password_confirmation: "password"
)
file = URI.open("https://source.unsplash.com/featured/?woman")
cassandra.photo.attach(io: file, filename: 'cassandra.png', content_type: 'image/png')

ameya = User.create!(
  first_name: "Ameya",
  last_name: "Akhouri",
  mobile: "0444 888 888",
  address: "1 Exhibition Street, Melbourne, 3000, VIC",
  email: "ameya@user.com",
  password: "password",
  password_confirmation: "password"
)
file = URI.open("https://source.unsplash.com/featured/?man")
ameya.photo.attach(io: file, filename: 'ameya.png', content_type: 'image/png')

bob = User.create!(
  first_name: "Bob",
  last_name: "Smith",
  mobile: "0444 111 111",
  address: "1 Elonera Avenue, Greensborough, VIC 3088",
  email: "bob@user.com",
  password: "password",
  password_confirmation: "password"
)
file = URI.open("https://source.unsplash.com/featured/?man")
bob.photo.attach(io: file, filename: 'bob.png', content_type: 'image/png')

jane = User.create!(
  first_name: "Jane",
  last_name: "Doe",
  mobile: "0444 222 222",
  address: "1 Pyalong Avenue, Rosanna VIC 3084",
  email: "jane@user.com",
  password: "password",
  password_confirmation: "password"
)
file = URI.open("https://source.unsplash.com/featured/?woman")
jane.photo.attach(io: file, filename: 'jane.png', content_type: 'image/png')

emily = User.create!(
  first_name: "Emily",
  last_name: "Johnston",
  mobile: "0444 333 333",
  address: "90 Boundary St, Paddington NSW 2021",
  email: "emily@user.com",
  password: "password",
  password_confirmation: "password"
)
file = URI.open("https://source.unsplash.com/featured/?woman")
emily.photo.attach(io: file, filename: 'emily.png', content_type: 'image/png')

puts 'Creating Favours...'
bob_favour_1 = Favour.create!(
  category: "#{%w[Groceries Gardening Pets Other].sample}",
  title: "#{Faker::Verb.base.capitalize} #{Faker::Creature::Animal.name.capitalize} #{Faker::Verb.ing_form.capitalize}",
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  address: "#{bob.address}",
  status: "Open",
  recipient: bob,
  completion_date: Faker::Date.between(from: 1.week.from_now, to: 1.month.from_now)
)

bob_favour_2 = Favour.create!(
  category: "#{%w[Groceries Gardening Pets Other].sample}",
  title: "#{Faker::Verb.base.capitalize} #{Faker::Creature::Animal.name.capitalize} #{Faker::Verb.ing_form.capitalize}",
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  address: "#{bob.address}",
  status: "Accepted",
  recipient: bob,
  helper: ameya,
  completion_date: Faker::Date.between(from: 1.week.from_now, to: 1.month.from_now)
)

jane_favour_1 = Favour.create!(
  category: "#{%w[Groceries Gardening Pets Other].sample}",
  title: "#{Faker::Verb.base.capitalize} #{Faker::Creature::Animal.name.capitalize} #{Faker::Verb.ing_form.capitalize}",
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  address: "#{jane.address}",
  status: "Done",
  recipient: jane,
  helper: nikolai,
  completion_date: Faker::Date.backward(days: 30)
)

jane_favour_2 = Favour.create!(
  category: "#{%w[Groceries Gardening Pets Other].sample}",
  title: "#{Faker::Verb.base.capitalize} #{Faker::Creature::Animal.name.capitalize} #{Faker::Verb.ing_form.capitalize}",
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  address: "#{jane.address}",
  status: "Done",
  recipient: jane,
  helper: cassandra,
  completion_date: Faker::Date.backward(days: 30)
)

jane_favour_3 = Favour.create!(
  category: "#{%w[Groceries Gardening Pets Other].sample}",
  title: "#{Faker::Verb.base.capitalize} #{Faker::Creature::Animal.name.capitalize} #{Faker::Verb.ing_form.capitalize}",
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  address: "#{jane.address}",
  status: "Open",
  recipient: jane,
  completion_date: Faker::Date.between(from: 1.week.from_now, to: 1.month.from_now)
)

emily_favour_1 = Favour.create!(
  category: "#{%w[Groceries Gardening Pets Other].sample}",
  title: "#{Faker::Verb.base.capitalize} #{Faker::Creature::Animal.name.capitalize} #{Faker::Verb.ing_form.capitalize}",
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  address: "#{emily.address}",
  status: "Open",
  recipient: emily,
  completion_date: Faker::Date.between(from: 1.week.from_now, to: 1.month.from_now)
)

emily_favour_2 = Favour.create!(
  category: "#{%w[Groceries Gardening Pets Other].sample}",
  title: "#{Faker::Verb.base.capitalize} #{Faker::Creature::Animal.name.capitalize} #{Faker::Verb.ing_form.capitalize}",
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  address: "#{emily.address}",
  status: "Open",
  recipient: emily,
  completion_date: Faker::Date.between(from: 1.week.from_now, to: 1.month.from_now)
)

emily_favour_3 = Favour.create!(
  category: "#{%w[Groceries Gardening Pets Other].sample}",
  title: "#{Faker::Verb.base.capitalize} #{Faker::Creature::Animal.name.capitalize} #{Faker::Verb.ing_form.capitalize}",
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  address: "#{emily.address}",
  status: "Open",
  recipient: emily,
  completion_date: Faker::Date.between(from: 1.week.from_now, to: 1.month.from_now)
)

puts 'Creating Favour Applications...'
nikolai_favour_application_1 = FavourApplication.create!(
  favour: bob_favour_2,
  applicant: nikolai,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Rejected"
)

nikolai_favour_application_2 = FavourApplication.create!(
  favour: bob_favour_1,
  applicant: nikolai,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Pending"
)

nikolai_favour_application_3 = FavourApplication.create!(
  favour: jane_favour_1,
  applicant: nikolai,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Accepted"
)

nikolai_favour_application_4 = FavourApplication.create!(
  favour: emily_favour_1,
  applicant: nikolai,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Pending"
)

nikolai_favour_application_5 = FavourApplication.create!(
  favour: emily_favour_2,
  applicant: nikolai,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Pending"
)

cassandra_favour_application_1 = FavourApplication.create!(
  favour: bob_favour_2,
  applicant: cassandra,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Rejected"
)

cassandra_favour_application_2 = FavourApplication.create!(
  favour: jane_favour_1,
  applicant: cassandra,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Rejected"
)

cassandra_favour_application_3 = FavourApplication.create!(
  favour: jane_favour_2,
  applicant: cassandra,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Accepted"
)

cassandra_favour_application_4 = FavourApplication.create!(
  favour: emily_favour_1,
  applicant: cassandra,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Pending"
)

cassandra_favour_application_5 = FavourApplication.create!(
  favour: emily_favour_2,
  applicant: cassandra,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Pending"
)

ameya_favour_application_1 = FavourApplication.create!(
  favour: bob_favour_1,
  applicant: ameya,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Pending"
)

ameya_favour_application_2 = FavourApplication.create!(
  favour: bob_favour_2,
  applicant: ameya,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Accepted"
)

ameya_favour_application_3 = FavourApplication.create!(
  favour: jane_favour_1,
  applicant: ameya,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Rejected"
)

ameya_favour_application_4 = FavourApplication.create!(
  favour: emily_favour_1,
  applicant: ameya,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Pending"
)

ameya_favour_application_5 = FavourApplication.create!(
  favour: emily_favour_2,
  applicant: ameya,
  message: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  status: "Pending"
)

puts 'Creating Reviews...'
jane_review_1 = Review.create!(
  favour: jane_favour_1,
  subject: "Recipient",
  rating: 5,
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  recipient: jane,
  helper: nikolai
)

jane_review_2 = Review.create!(
  favour: jane_favour_2,
  subject: "Recipient",
  rating: 4,
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  recipient: jane,
  helper: cassandra
)

nikolai_review_1 = Review.create!(
  favour: jane_favour_1,
  subject: "Helper",
  rating: 4,
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  recipient: jane,
  helper: nikolai
)

cassandra_review_1 = Review.create!(
  favour: jane_favour_2,
  subject: "Helper",
  rating: 4,
  description: "#{Faker::Movie.quote}. #{Faker::Movie.quote}.",
  recipient: jane,
  helper: cassandra
)

puts 'Done!!! :) :D :o'


