# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "cleaning db"
Request.destroy_all
Instrument.destroy_all

file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')


teaching_t = User.find(2)
puts teaching_t.first_name


instrument1 = Instrument.new({name: "Piano"})
instrument2 = Instrument.new({name: "Drums"})
guitar = Instrument.new({ name: 'Guitar', price: 20, description: 'Nice vintage guitar'})
instrument1.user = teaching_t
instrument2.user = teaching_t
guitar.user = teaching_t

request1 = Request.new({user: teaching_t, instrument: instrument1, accepted: false, start_date: Date.parse('17/9/2012'), end_date: Date.parse('19/9/2016')})
request2 = Request.new({user: teaching_t, instrument: instrument2, accepted: false, start_date: Date.parse('17/9/2014'), end_date: Date.parse('19/9/2018')})
request = Request.new({user: teaching_t, instrument: guitar, accepted: false, start_date: Date.parse('17/9/2015'), end_date: Date.parse('19/9/2015')})

# guitar.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# request.user = User.last
# guitar.user = User.last


instrument1.save
instrument2.save
guitar.save

request2.save
request1.save

request.save
puts "guitar msgs"
puts guitar.errors.full_messages
puts "request msgs"
puts request.errors.full_messages

puts "you have #{Instrument.count} instruments and #{Request.count} requests"
