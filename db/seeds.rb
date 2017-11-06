# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sport.destroy_all

Sport.create!([
  {name: "Tennis"},
  {name:'Football'},
  {name:'Swimming'},
  {name:'Running'},
  {name:'Ping pong'},
  {name:'Squash'},
  {name:'Golf'},
  {name:'Gym'},
  {name:'Hockey'},
  {name:'Netball'},
  {name:'Basketball'},
  {name:'Volleyball'},
  {name:'Baseball'},
  {name:'Rugby'},
  {name:'AFL'},
  {name:'Snowboard'},
  {name:'Surfing'},
  {name:'Archery'}
  ])

p "Created #{Sport.count} sports"
