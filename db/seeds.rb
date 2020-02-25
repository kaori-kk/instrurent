# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# instruments = instrument.create([{name: 'Guitar', price: '15', description: 'Like new', user_id: '1'}])


puts "cleaning db"
Request.destroy_all
Instrument.destroy_all
guitar = Instrument.new({ name: 'Guitar', price: 20, description: 'Nice vintage guitar'})
guitar.user = User.last
request = Request.new({user: User.last, instrument: guitar, accepted: false, start_date: Date.parse('17/9/2015'), end_date: Date.parse('19/9/2015')})
request.user = User.last
guitar.save
request.save
puts "guitar msgs"
puts guitar.errors.full_messages
puts "request msgs"
puts request.errors.full_messages
puts "you have #{Instrument.count} instruments and #{Request.count} requests"
