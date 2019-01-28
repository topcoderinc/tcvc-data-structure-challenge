
House.destroy_all

10.times do
  House.create!(
    address: Faker::Address.street_address,
    cost: Faker::Number.number(6),
    down_payment: Faker::Number.number(4),
    interest: Faker::Number.decimal(2),
    period: Faker::Number.between(1, 10),
    taxes: Faker::Number.number(4)
  )
end
houses = House.all

puts "Seed Finished"
puts "#{House.count} houses created"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?