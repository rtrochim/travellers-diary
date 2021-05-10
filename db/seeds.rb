# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
5.times do
  User.create(
    uid: Faker::Number.number(digits: 21),
    provider: :google_oauth2,
    email: Faker::Internet.email,
    name: Faker::Name.name,
    image: Faker::Avatar.image
  )
end

# Weather Reports
15.times do
  WeatherReport.create(
    city: Location.city.sample,
    weather: WeatherReport::WEATHER_TYPES.sample,
    temperature: Faker::Number.between(from: -30, to: 40)
  )
end

# Covid Reports and Notes
WeatherReport.all.each do |weather_report|
  CovidReport.create(
    country: weather_report.city.parent,
    cases: Faker::Number.between(from: 1000, to: 10000),
    deaths: Faker::Number.between(from: 1000, to: 10000),
    recovered: Faker::Number.between(from: 1000, to: 10000)
  )
  Note.create(
    user: User.all.sample,
    city: weather_report.city,
    weather_report: weather_report,
    covid_report: CovidReport.where(country: weather_report.city.parent).sample,
    travelled_at: Faker::Date.between(from: 1.year.ago, to: Date.today),
    content: Faker::Lorem.paragraph(sentence_count: 3, supplemental: true, random_sentences_to_add: 3)
  )
end
