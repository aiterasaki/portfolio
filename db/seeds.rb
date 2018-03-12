# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(nick_name: "テスト確認用",
			 first_name:  "Example",
			 last_name:  "User",
			 first_name_kana: "テスト",
			 last_name_kana: "カクニンヨウ",
			 postal_code: "123-456",
			 region_id: "1",
			 address_city: "札幌市",
			 address_street: "中央区",
			 address_building: "１−１−２",
			 telephone: "090-1234-5678",
             email: "test@test",
             password:              "000000",
             password_confirmation: "000000",
			 )