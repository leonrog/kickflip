# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'uri'
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

User.destroy_all
Obstacle.destroy_all
Review.destroy_all
Booking.destroy_all

puts 'Start kickflip seeding'

# ---Users for Demo------------------------------------------

dion = User.create!(email: 'dion@gmail.com', password: '123456')
marcel = User.create!(email: 'marcel@gmail.com', password: '123456')
nikos = User.create!(email: 'nikos@gmail.com', password: '123456')

url_dion = 'https://res.cloudinary.com/diopgwo4d/image/upload/c_fit,h_2696/v1614261681/shawn-D2CXn1266-E-unsplash_osbapv.jpg'
filename = File.basename(URI.parse(url_dion).path)
file = URI.open(url_dion)
dion.photo.attach(io: file, filename: filename)
dion.save!

url_marcel = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614346896/elueyf46ffxtm6gtaapgo2glo3qe.png'
filename = File.basename(URI.parse(url_marcel).path)
file = URI.open(url_marcel)
marcel.photo.attach(io: file, filename: filename)
marcel.save!

url_nikos = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614351656/Screenshot_2021-02-26_at_16.00.48_mwytux.png'
filename = File.basename(URI.parse(url_nikos).path)
file = URI.open(url_nikos)
nikos.photo.attach(io: file, filename: filename)
nikos.save!



# ---Obstacles for Demo-----------------------------------------
small_ramp =       Obstacle.create!(name: 'Small Ramp',          category: 'Ramp',     price: 10, availability: true, user: dion, description: 'This is my go-to obstacle when trying out new tricks. Can highly recommend',                                                                    location: 'Berlin')
curb_kings =       Obstacle.create!(name: 'Curb Kings',          category: 'Curb',     price: 20, availability: true, user: marcel, description: 'Just got this curb myself, but will be on vacation for one month now', location: 'Munich')
kinked_handrail =  Obstacle.create!(name: 'Kinked Handrail',     category: 'Handrail', price: 15, availability: true, user: dion, description: 'This handrail is just sick!! A must have when skating with friends',                                                                                            location: 'Munich')
two_way_skate_ramp = Obstacle.create!(name: '2-way Skate Ramp',  category: 'Ramp',     price: 18, availability: true, user: marcel, description: 'Perfect for trying out new jumps! You can also test it before making a booking',                                                                                       location: 'Hamburg')
four_way_skate_ramp = Obstacle.create!(name: '4-way Skate Ramp', category: 'Ramp',     price: 25, availability: true, user: nikos, description: 'NKX 4-way skate ramp to test your new tricks, absolutely love this obstacle',                                                                            location: 'Berlin')
flat_spot_rail =  Obstacle.create!(name: 'Flat Spot Rail',       category: 'Flatrail', price: 30, availability: true, user: nikos, description: 'Flat spot rail to go, perfect to take with you when skating with friends',                                                                                                    location: 'Hamburg')


url_small_ramp = 'https://res.cloudinary.com/diopgwo4d/image/upload/c_fit,h_2696/v1614261681/shawn-D2CXn1266-E-unsplash_osbapv.jpg'
filename = File.basename(URI.parse(url_small_ramp).path)
file = URI.open(url_small_ramp)
small_ramp.photo.attach(io: file, filename: filename)
small_ramp.save!

url_curb_kings = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614184258/1tucroxmjup81rp2vpadxp724kt2.jpg'
filename = File.basename(URI.parse(url_curb_kings).path)
file = URI.open(url_curb_kings)
curb_kings.photo.attach(io: file, filename: filename)
curb_kings.save!

url_kinked_handrail = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614260045/handrail_lpymo4.jpg'
filename = File.basename(URI.parse(url_kinked_handrail).path)
file = URI.open(url_kinked_handrail)
kinked_handrail.photo.attach(io: file, filename: filename)
kinked_handrail.save!

url_two_way_skate_ramp = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614260045/2-way_Skate_Ramp_cggiim.jpg'
filename = File.basename(URI.parse(url_two_way_skate_ramp).path)
file = URI.open(url_two_way_skate_ramp)
two_way_skate_ramp.photo.attach(io: file, filename: filename)
two_way_skate_ramp.save!

url_four_way_skate_ramp = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614260045/4-way_skate_ramp_zzibj3.jpg'
filename = File.basename(URI.parse(url_four_way_skate_ramp).path)
file = URI.open(url_four_way_skate_ramp)
four_way_skate_ramp.photo.attach(io: file, filename: filename)
four_way_skate_ramp.save!

url_flat_spot_rail = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614260045/flat_spot_rail_bbo3ul.jpg'
filename = File.basename(URI.parse(url_flat_spot_rail).path)
file = URI.open(url_flat_spot_rail)
flat_spot_rail.photo.attach(io: file, filename: filename)
flat_spot_rail.save!


# ---Reviews for Demo------------------------------------------

nikos_review = Review.create!(title: 'Just dope', description: 'Goot stuff good stuff. Stopped talking to my duck afterwards', rating: 5, obstacle: small_ramp, user: nikos )
marcel_review = Review.create!(title: 'Sickkk', description: 'Managed to land my first kickflip ever', rating: 5, obstacle: small_ramp, user: marcel )


puts 'All done, enjoyy'
