# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Erasing meetings Database'
Meeting.destroy_all
puts 'Meetings Database erased'

# puts 'Erasing users Database'
# User.destroy_all
# puts 'Users Database erased'

# puts 'Creating new users'

# user1 = User.new(
#   email: 'guilhermepetkovic@hotmail.com',
#   password: '123456',
#   username: 'g.petkovic'
# )
# user1.save

# user2 = User.new(
#   email: 'miranda_chaves@hotmail.com',
#   password: '123456',
#   username: 'a.miranda'
# )
# user2.save

# user3 = User.new(
#   email: 'h.amouei@web.de',
#   password: '123456',
#   username: 'h.amouei'
# )
# user3.save

# user4 = User.new(
#   email: 'fccristino@hotmail.com',
#   password: '123456',
#   username: 'f.catao'
# )
# user4.save

# puts "#{User.count} users created"

puts 'Creating new meetings'

20.times do
  start_time = Time.now + (1..30_000).to_a.sample
  end_time = start_time + (900..7_500).to_a.sample
  actual_start_time = start_time + (0..1_200).to_a.sample
  actual_end_time = actual_start_time + (900..7_500).to_a.sample
  meeting = Meeting.new(
    expected_start_date: start_time,
    expected_end_date: end_time,
    expected_duration: (end_time - start_time).to_i / 60,
    actual_start_date: actual_start_time,
    actual_end_date: actual_end_time,
    actual_duration: (actual_end_time - actual_start_time).to_i,
    participants_number: rand(2..15),
    user_id: ((User.first.id)..(User.last.id)).to_a.sample
  )
  meeting.save
end

puts "#{Meeting.count} meetings created"
