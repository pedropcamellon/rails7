# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

3.times do
    User.create(first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      company: Faker::Company.name,
      email: Faker::Internet.email,
      password: 'password'
    )
  end
  
  User.all.each do |user|
    5.times do
      user.clients.create(
        company_name: Faker::Company.name,
        value: 5000
      )
    end
  end
  
  Client.all.each do |client|
    5.times do
      client.contacts.create(
        name: Faker::Name.name,
        role: Faker::Company.profession,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        decision_maker: false
      )
  
      client.comments.create(
        title: Faker::RickAndMorty.quote,
        body: Faker::Hipster.paragraph
      )
    end
  end
  