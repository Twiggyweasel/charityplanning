# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Size.create! label: 'Small'
Size.create! label: 'Medium'
Size.create! label: 'Large'
Size.create! label: 'XL'
Size.create! label: 'XXL'
Size.create! label: 'XXXL'


Event.create! name: 'Magic Event', desc: 'This is a test!', teaser: 'so much test right now', venue_name: 'Granite Park', street: '1234 Test St', city: 'lenexa', state: 'KS', zip: '66215', date: '2016-12-30', registration_start: '2016-7-12', start_time: '2000-01-01 21:30:00', goal: 1500.00, is_private: false, size_ids: [1,2,3,4]
Event.create! name: 'Magic Event 2', desc: 'This is a test!', teaser: 'so much test right now', venue_name: 'Granite Park', street: '1234 Test St', city: 'lenexa', state: 'KS', zip: '66215', date: '2016-12-30', registration_start: '2016-7-12', start_time: '2000-01-01 21:30:00', goal: 1500.00, has_donation: true, size_ids: [1,2,3]