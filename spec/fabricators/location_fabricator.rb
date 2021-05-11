Fabricator(:country, from: :location) do
  parent_id nil
  name { Faker::Address.country }
end

Fabricator(:city, from: :location) do
  parent { Fabricate(:country) }
  name { Faker::Address.city }
end
