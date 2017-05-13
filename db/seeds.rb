if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)
ru2 = Role.create(name: 'inspector', info: 'Проверяющий', full_info: 'Проверяющий из министерства')
Collection.create(colname: 'Статуэтки', shdescription: 'Описание для статуэток', begindate: DateTime.parse("05/04/2017", "%m/%d/%Y %H:%M"), enddate: DateTime.parse("01/06/2017", "%m/%d/%Y %H:%M"))
Collection.create(colname: 'Медали', shdescription: 'Описание для древних медалей', begindate: DateTime.parse("25/04/2017", "%m/%d/%Y %H:%M"), enddate: DateTime.parse("16/06/2017", "%m/%d/%Y %H:%M"))
Showroom.create(roomname: "Зал древностей")
Showroom.create(roomname: "Древний Египет")
Exhibit.create(name: "Статуэтка дракона", sdescription: "Статуэтка из Египта", insurance: 1000, century: 1, height: 10, width: 15, length: 15, tempcontrol: true, himiditycontrol: true, peopleprotect: true, collection_id: 1)
Exhibit.create(name: "Медаль владыки", sdescription: "Медаль древнего повелителя", insurance: 10000000, century: 2, height: 15, width: 17, length: 10, tempcontrol: true, himiditycontrol: false, peopleprotect: true, collection_id: 2)
Exhibit.create(name: "Медаль командующего", sdescription: "Медаль командира древнего войска", insurance: 234000000, century: 3, height: 15, width: 17, length: 10, tempcontrol: true, himiditycontrol: false, peopleprotect: true, collection_id: 2)
Collection.first.showrooms << Showroom.first
Collection.first.showrooms << Showroom.second
Collection.second.showrooms << Showroom.first
