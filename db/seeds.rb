# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |i|
	rand(1...10).times do |j|
		Task.create(name: "Apple#{i}-#{i}", user_id: 1, done_at: i.days.ago, completed: true)
	end
end 