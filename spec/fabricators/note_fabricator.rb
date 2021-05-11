Fabricator(:note) do
  user
  city
  weather_report { Fabricate(:weather_report, city: Location.city.all.sample) }
  covid_report { Fabricate(:covid_report, country: Location.city.all.sample.parent) }
  travelled_at { Faker::Date.between(from: 1.year.ago, to: Date.today) }
  content { Faker::Lorem.paragraph(sentence_count: 3, supplemental: true, random_sentences_to_add: 3) }
end
