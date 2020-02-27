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
user1 = User.create({ first_name: 'Kaori', last_name: 'Kamehameha', email: "fullsupersaiyan@gmail.com", password: "123456"})
user2 = User.create({ first_name: 'Jules', last_name: 'Judy', email: "julesjudy@gmail.com", password: "223456"})
user3 = User.create({ first_name: 'Traveling', last_name: 'Tice', email: "TravelingT@gmail.com", password: "323456"})
user4 = User.create({ first_name: 'Jules', last_name: 'Verne', email: "OriginalVerne@gmail.com", password: "423456"})
user5 = User.create({ first_name: 'David', last_name: 'Thoraux', email: "nature_boy@gmail.com", password: "523456"})
user6 = User.create({ first_name: 'Walt', last_name: 'Witman', email: "poet123@gmail.com", password: "623456"})
user7 = User.create({ first_name: 'Herman', last_name: 'Melville', email: "WhiteWhale@gmail.com", password: "723456"})
user8 = User.create({ first_name: 'Kurtis', last_name: 'Johnson', email: "K.johnson@gmail.com", password: "823456"})

puts "Creating instruments",

INSTRUMENT_PARAMS = [
  {filename: "guitar1.png", user: user1, name: 'Guitar', price: 20, description: 'Nice vintage guitar'},
  {filename: "piano1.png", user: user2, name: 'Piano', price: 300, description: 'Beautiful piano made with ivory'},
  {filename: "guitar2.png", user: user3, name: 'Guitar', price: 40, description: "Used bongo's, still produce good sound"},
  {filename: "bass1.png", user: user5, name: 'Bass', price: 190, description: "It's a good instrument, but not much used."},
  {filename: "guitar3.png", user: user5, name: 'Guitar', price: 250, description: 'Nice vintage guitar'},
  {filename: "drum1.png", user: user8, name: 'Drum', price: 80, description: 'I left my body the first time I touched this instrument'},
  {filename: "piano2.png", user: user7, name: 'Piano', price: 7, description: "It's also a nice kitchen seat"},
  {filename: "drum2.png", user: user5, name: 'Drum', price: 250, description: 'Used drums'},
]


INSTRUMENT_PARAMS.each do |instrument_param|
  file_name = instrument_param[:filename]
  instrument_param.delete(:filename)
  instrument = Instrument.new(instrument_param)
  instrument.photo.attach(io: File.open(File.join(Rails.root, "/app/assets/images/#{file_name}")), filename: file_name)
  puts "Here's an instrument #{instrument.name}"
  instrument.save
end

 # || "instrument" + (2..8).to_a.sample.to_s + ".png"

puts "Creating requests"
request1 = Request.new({user: user1, instrument: Instrument.all.sample, status: "pending", start_date: Date.parse('12/9/2019'), end_date: Date.parse('19/9/2020')})
request2 = Request.new({user: user2, instrument: Instrument.all.sample, status: "pending", start_date: Date.parse('18/8/2019'), end_date: Date.parse('29/9/2020')})
request3 = Request.new({user: user3, instrument: Instrument.all.sample, status: "pending", start_date: Date.parse('1/6/2019'), end_date: Date.parse('19/2/2020')})
request4 = Request.new({user: user4, instrument: Instrument.all.sample, status: "pending", start_date: Date.parse('5/6/2019'), end_date: Date.parse('1/1/2020')})
request5 = Request.new({user: user5, instrument: Instrument.all.sample, status: "pending", start_date: Date.parse('7/12/2019'), end_date: Date.parse('11/6/2020')})
request6 = Request.new({user: user6, instrument: Instrument.all.sample, status: "pending", start_date: Date.parse('14/4/2019'), end_date: Date.parse('12/5/2020')})
request7 = Request.new({user: user7, instrument: Instrument.all.sample, status: "pending", start_date: Date.parse('16/1/2019'), end_date: Date.parse('12/3/2020')})
request8 = Request.new({user: user8, instrument: Instrument.all.sample, status: "pending", start_date: Date.parse('9/9/2019'), end_date: Date.parse('12/2/2020')})


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
