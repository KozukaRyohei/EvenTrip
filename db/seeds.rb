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
   name: '「桑原由気と本渡楓のパリパリパーリィ☆ 6th Anniversary Greeting Parry ～Twinkle Collaboration Parry～」Afternoon Parry',
   hold_date: '2023-04-23',
   hold_place: '科学技術館サイエンスホール',
)
Event.create!(
   name: '桑原由気 Fan Fun Festa 2023 昼の部',
   hold_date: '2023-05-21',
   hold_place: 'シダックスカルチャーホールA',
)
Event.create!(
   name: '7周年記念イベント！サイン会inマウスショップ 桑原由気回',
   hold_date: '2023-08-13',
   hold_place: 'マウスショップB1Fイベントスペース',
)

