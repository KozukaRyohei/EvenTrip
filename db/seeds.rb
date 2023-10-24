# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'test@test.com',
   password: '123456'
)


  Event.create!(
    name: '平日深呼吸。桑原由気&高田憂希　バスツアー第二弾',
    hold_date: '2023-10-22',
    hold_place: '関東近郊'
 )
