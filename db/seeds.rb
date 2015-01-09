# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SEEDS!'
bottles = Bottle.create!([
  {name: 'Pink Bottle', color: 'Pink'},
  {name: 'Blue Bottle', color: 'Blue'},
  {name: 'Rose Bottle', color: 'Rose'},
  {name: 'Rose Bottle', color: 'Rose'},
  {name: 'Rose Bottle', color: 'Rose'},
  {name: 'Rose Bottle', color: 'Rose'},
  {name: 'Rose Bottle', color: 'Rose'},
  {name: 'Red Bottle', color: 'Red'}
])
