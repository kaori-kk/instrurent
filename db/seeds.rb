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
User.destroy_all

# file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

puts "Creating users"
user1 = User.new({ first_name: 'Kaori', last_name: 'Kamehameha', email: "fullsupersaiyan@gmail.com", password: "123456"})
user2 = User.new({ first_name: 'Jules', last_name: 'Judy', email: "julesjudy@gmail.com", password: "223456"})
user3 = User.new({ first_name: 'Traveling', last_name: 'Tice', email: "TravelingT@gmail.com", password: "323456"})
user4 = User.new({ first_name: 'Jules', last_name: 'Verne', email: "OriginalVerne@gmail.com", password: "423456"})
user5 = User.new({ first_name: 'David', last_name: 'Thoraux', email: "nature_boy@gmail.com", password: "523456"})
user6 = User.new({ first_name: 'Walt', last_name: 'Witman', email: "poet123@gmail.com", password: "623456"})
user7 = User.new({ first_name: 'Herman', last_name: 'Melville', email: "WhiteWhale@gmail.com", password: "723456"})
user8 = User.new({ first_name: 'Kurtis', last_name: 'Johnson', email: "K.johnson@gmail.com", password: "823456"})

puts "Creating instruments"
instrument1 = Instrument.new({user: user1, nalme: 'Guitar', price: 20, description: 'Nice vintage guitar'})
instrument1.photo.attach(io: asset-url('/assets/images/instrument1.png'), filename: 'file.pdf')

instrument2 = Instrument.new({user: user2, name: 'Piano', price: 300, description: 'Beautiful piano made with ivory'})
instrument3 = Instrument.new({user: user3, name: 'Guitar', price: 40, description: "Used bongo's, still produce good sound"})
instrument4 = Instrument.new({user: user4, name: 'Bass', price: 190, description: "My unlce like to slappa da bass, thats where I got it from, but nowadays I'm busy learning to code, so I don't have much time anymore. It's a good instrument, but not much used."})
instrument5 = Instrument.new({user: user5, name: 'Guitar', price: 250, description: 'Nice vintage guitar'})
instrument6 = Instrument.new({user: user6, name: 'Harmonica', price: 3, description: 'I used this with my mouth.'})
instrument7 = Instrument.new({user: user7, name: 'Piano', price: 7, description: "It's also a nice kitchen seat"})
instrument8 = Instrument.new({user: user8, name: 'Drum', price: 80, description: 'I left my body the first time I touched this instrument'})
instrument51 = Instrument.new({user: user5, name: 'Guitar', price: 40, description: 'Nice vintage guitar'})
instrument52 = Instrument.new({user: user5, name: 'Drum', price: 250, description: 'Used drums'})
instrument53 = Instrument.new({user: user5, name: 'Violin', price: 400, description: 'Winewood voilin made by gimli of mordor'})
instrument54 = Instrument.new({user: user5, name: 'Violin', price: 20, description: 'Peruvian original'})
puts "Here's an instrument #{instrument8.name}"


puts "Creating requests"
request1 = Request.new({user: user1, instrument: instrument1, accepted: false, start_date: Date.parse('12/9/2019'), end_date: Date.parse('19/9/2020')})
request2 = Request.new({user: user2, instrument: instrument2, accepted: false, start_date: Date.parse('18/8/2019'), end_date: Date.parse('29/9/2020')})
request3 = Request.new({user: user3, instrument: instrument3, accepted: false, start_date: Date.parse('1/6/2019'), end_date: Date.parse('19/2/2020')})
request4 = Request.new({user: user4, instrument: instrument4, accepted: false, start_date: Date.parse('5/6/2019'), end_date: Date.parse('1/1/2020')})
request5 = Request.new({user: user5, instrument: instrument5, accepted: false, start_date: Date.parse('7/12/2019'), end_date: Date.parse('11/6/2020')})
request6 = Request.new({user: user6, instrument: instrument6, accepted: false, start_date: Date.parse('14/4/2019'), end_date: Date.parse('12/5/2020')})
request7 = Request.new({user: user7, instrument: instrument7, accepted: false, start_date: Date.parse('16/1/2019'), end_date: Date.parse('12/3/2020')})
request8 = Request.new({user: user8, instrument: instrument8, accepted: false, start_date: Date.parse('9/9/2019'), end_date: Date.parse('12/2/2020')})

instrument1.save
instrument2.save
instrument3.save
instrument4.save
instrument5.save
instrument6.save
instrument7.save
instrument8.save
instrument51.save
instrument52.save
instrument53.save
instrument54.save

user1.save
user2.save
user3.save
user4.save
user5.save
user6.save
user7.save
user8.save

request1.save
request2.save
request3.save
request4.save
request5.save
request6.save
request7.save
request8.save
# guitar.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# request.user = User.last
# guitar.user = User.last



# puts "guitar msgs"
# puts errors.full_messages
# puts "request msgs"
# puts errors.full_messages

puts "you have #{Instrument.count} instruments, #{User.count} users and #{Request.count} requests"
