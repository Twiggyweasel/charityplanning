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

Role.create! name: 'user'
Role.create! name: 'event_coordinator'
Role.create! name: 'organization_admin'
Role.create! name: 'admin'

Organization.create! name: 'Twiggystudios'


Event.create! name: 'Magic Event', desc: 'This is a test!', teaser: 'so much test right now', venue_name: 'Granite Park', street: '1234 Test St', city: 'lenexa', state: 'KS', zip: '66215', date: '2016-12-30', registration_start: '2016-7-12', start_time: '2000-01-01 21:30:00', goal: 1500.00, raised: 0, is_private: false, organization_id: 1, size_ids: [1,2,3,4]
Event.create! name: 'Magic Event 2', desc: 'This is a test!', teaser: 'so much test right now', venue_name: 'Granite Park', street: '1234 Test St', city: 'lenexa', state: 'KS', zip: '66215', date: '2016-12-30', registration_start: '2016-7-12', start_time: '2000-01-01 21:30:00', goal: 1500.00, raised: 0, has_donation: true, organization_id: 1, size_ids: [1,2,3]

RegistrationFee.create! name: 'Adult', amount: 25.00, event_id: 1
RegistrationFee.create! name: 'Child', amount: 10.00, event_id: 1
RegistrationFee.create! name: 'Adult', amount: 25.00, event_id: 2
RegistrationFee.create! name: 'Child', amount: 10.00, event_id: 2

User.create! email: 'orsusbass@gmail.com', password: 'hat21day'
Profile.create! first_name: 'Richard', last_name: 'Wise', user_id: 1