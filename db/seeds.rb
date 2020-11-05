# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'test@test.test',
    password: 'password'
)

EndUser.create!(
    last_name: '原',
    first_name: '大河',
    last_name_kana: 'ハラ',
    first_name_kana: 'タイガ',
    postal_code: '0800318',
    address: '北海道音更町緑陽台',
    phone_number: '00000000000',
    email: 'test@test.test',
    password: 'password'
)
