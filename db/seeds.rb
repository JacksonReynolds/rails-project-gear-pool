# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
jackson = User.create(user_name: 'jackson', password:'jackson')
bouldering = GearList.create(name: 'bouldering starter pack')
trip = jackson.trips.build(
    destination: 'Rumbling Bald',
    pickup: Time.now,
    dropoff: Time.new(2020, 9, 27)
    )
trip.gear_list = bouldering
trip.save
bouldering.items.build([{name: 'big organic', description: '5" thick Organic crash pad', condition: 'fair'},
            {name: 'chalk pot', description: "holds tons of chalk", condition: 'dusty'},
            {name: 'shoes', description: 'La Sportiva Skwanas', condition: 'need love'}])
            
bouldering.save