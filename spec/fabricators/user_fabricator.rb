Fabricator(:user) do
  uid { Faker::Number.number(digits: 21) }
  provider { :google_oauth2 }
  email { Faker::Internet.email }
  name { Faker::Name.name }
  image { Faker::Avatar.image }
end
