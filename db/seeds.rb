puts 'SEEDS!'
Bottle.destroy_all
(1..18).each_with_index do |thing, i|
  bottles = Bottle.create!({
    name: "Bottle #{i + 1}",
    color: ['Red', 'Green', 'Blue', 'Black'].sample
  })
end
