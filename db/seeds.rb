require 'faker'
puts "🌱 Seeding spices..."

# Seed your database here
# User.create(name: "Lil John", email: "liljohn@test.com")
# User.create(name: "Snr Jake", email: "snrjake@test.com")
20.times do
    User.create(name: Faker::Name.first_name, email: "#{Faker.name}@test.com")
end
ItemType.create(name: "books")
ItemType.create(name: "vehicles")
RentalLevel.create(name: "rented")
RentalLevel.create(name: "returned")
20.times do
    Item.create(name: Faker::Lorem.word, item_type_id: rand(1..2))
end

50.times do
    RentalLog.create(
      item_id: rand(1..20),
      user_id: rand(1..20),
      rental_level_id: rand(1..2),
    )
  end
puts "✅ Done seeding!"
