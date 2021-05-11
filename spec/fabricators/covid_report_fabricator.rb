Fabricator(:covid_report) do
  country
  cases { Faker::Number.between(from: 1000, to: 10000) }
  deaths { Faker::Number.between(from: 1000, to: 10000) }
  recovered { Faker::Number.between(from: 1000, to: 10000) }
end