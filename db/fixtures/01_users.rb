User.seed do |s|
	s.id = 1
	s.nick_name = "管理者用"
	s.first_name =  "Admin"
	s.last_name =  "User"
	s.first_name_kana = "カンリシャ"
	s.last_name_kana = "ヨウ"
	s.postal_code = "123-456"
	s.region_id = "1"
	s.address_city = "札幌市"
	s.address_street = "中央区"
	s.address_building = "１−１−２"
	s.telephone = "090-1234-5678"
	s.email = "admin@admin.com"
	s.password =              "000000"
	s.password_confirmation = "000000"
	s.admin_flg = "true"

end

User.seed do |s|
	s.id = 2
	s.nick_name = "テスト確認用"
	s.first_name =  "Example"
	s.last_name =  "User"
	s.first_name_kana = "テスト"
	s.last_name_kana = "カクニンヨウ"
	s.postal_code = "123-456"
	s.region_id = "1"
	s.address_city = "札幌市"
	s.address_street = "中央区"
	s.address_building = "１−１−２"
	s.telephone = "090-1234-5678"
	s.email = "test@test.com"
	s.password =              "000000"
	s.password_confirmation = "000000"

end

10.times do  |i| 
  User.seed do |u|
  	u.id = i + 3
    u.nick_name = "ユーザー#{ i + 3 }番"
	u.first_name =  "Example#{ i + 3 }"
	u.last_name =  "User#{ i + 3 }"
	u.first_name_kana = "テスト#{ i + 3 }"
	u.last_name_kana = "カクニンヨウ#{ i + 3 }"
	u.postal_code = "123-456"
	u.region_id = rand(1..47)
	u.address_city = "札幌市"
	u.address_street = "中央区"
	u.address_building = "１−１−２#{ i + 3 }"
	u.telephone = "090-1234-56#{ i + 3 }"
	u.email = "test#{ i + 3 }@test"
	u.password =              "12345#{ i + 3 }"
	u.password_confirmation = "12345#{ i + 3 }"

  end
end	