require 'factory_girl_rails'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities_list = [
    'Тверь',
    'Ростов-на-Дону',
    'Москва',
    'Брянск',
    'Великий Новгород',
    'Новосибирск',
    'Кострома',
    'Белгород',
    'Липецк',
    'Краснодар',
    'Тюмень'
]

cities_list.each do |name|
  City.create(name: name)
end

10.times do
  FactoryGirl.create(:bank, name: Faker::Bank.name, city_id: Random.rand(1...10))
end

names_of_branches_list = %w[Отдел Филиал]

20.times do
  FactoryGirl.create(:branch,
                     name: names_of_branches_list.sample + " № #{Faker::Number.number(1)}" ,
                     address: Faker::Address.street_address,
                     bank_id: Random.rand(1...10))
end

20.times do
  FactoryGirl.create(:company,
                     title:              Faker::Company.name,
                     inn:                Faker::Number.number(10),
                     address:            Faker::Address.street_address,
                     registration_date:  Faker::Date.between(10.year.ago, Date.today),
                     okved:              Faker::Number.decimal(2),
                     comment:            Faker::Lorem.sentence,
                     phones:             Faker::PhoneNumber.cell_phone,
                     website:            Faker::Internet.domain_name,
                     kind:               Random.rand(0...1))
end

faces_list = [
    'Лидин Вацлав Архипович',
    'Янцижин Мартын Евграфович',
    'Черников Изяслав Вячеславович',
    'Чичваркина Светлана Игоревна',
    'Досаев Терентий Феоктистович',
    'Сомкина Анастасия Трофимовна',
    'Агапов ﻿Август Вячеславович',
    'Кривоухова Изольда Юлиевна',
    'Ромазанова Галина Брониславовна',
    'Чупринин Родион Адамович',
    'Богатырев Вадим Валериевич',
    'Борщёва Лилия Анатолиевна',
    'Климов Егор Никонович',
    'Игонин Евгений Афанасиевич',
    'Хабибуллина Наталья Евгениевна',
    'Юнге Эммануил Маркович',
    'Решетов Виталий Гордеевич',
    'Смолянинова Эльвира Афанасиевна',
    'Зубков Семен Остапович',
    'Мухаметов Лукьян Михеевич',
    'Малкина Екатерина Андрияновна',
    'Островский Федор Ерофеевич',
    'Гурковский Ярослав Иннокентиевич',
    'Витюгова Эльвира Родионовна',
    'Мельник Михаил Моисеевич',
    'Черкасов Платон Платонович',
    'Ерохина Агния Георгиевна',
    'Брант Михаил Елизарович',
    'Ягафаров Осип Михеевич',
    'Лукашенко Кузьма Евгениевич',
    'Унтилов Вячеслав Епифанович',
    'Юшкова Маргарита Иосифовна',
    'Ясева Татьяна Захаровна',
    'Ямковой Ксения Марковна',
    'Корбылев Юлиан Архипович',
    'Куклева Ника Николаевна',
    'Яблонцева Ариадна Олеговна',
    'Ласман Пимен Григориевич',
    'Тамаркина Виктория Анатолиевна',
    'Мышкина Ярослава Михеевна',
    'Масмеха Тамара Трофимовна',
    'Юмашев Назар Ипатиевич',
    'Шуршалина Альбина Владиленовна',
    'Ивкин Георгий Кириллович',
    'Завразина Дарья Виталиевна'
]

from_whom_list = [
    'от меня',
    'от него',
    'от Семена Аароновича',
    ''
]

faces_list.each do |name|
  FactoryGirl.create(:face,
                     full_name:       name,
                     personal_phone:  Faker::PhoneNumber.cell_phone,
                     work_phone:      Faker::PhoneNumber.cell_phone,
                     comment:         Faker::Lorem.sentence,
                     from_whom:       from_whom_list.sample )
end

50.times do
  FactoryGirl.create(:bank_account,
                     opening_date:    Faker::Date.between(5.year.ago, Date.today),
                     status:          Random.rand(0...5),
                     comment:         Faker::Lorem.sentence,
                     branch_id:       Random.rand(1...20),
                     company_id:      Random.rand(1...20))
end

20.times do
  FactoryGirl.create(:assignment,
                     date:            Faker::Date.between(5.year.ago, Date.today),
                     position:        Random.rand(0...1),
                     face_id:         Random.rand(1...45),
                     company_id:      Random.rand(1...20))
end

75.times do
  FactoryGirl.create(:status_log,
                     bank_account_id:    Random.rand(1...50),
                     change_date:        Faker::Date.between(3.year.ago, Date.today),
                     amount_in_account:  Faker::Number.decimal(7, 2),
                     message:            Faker::Lorem.sentence,
                     status:             Random.rand(0...5))
end

names_of_roles_list = [
    'Директор (оформление)',
    'Директор (поддержка)',
    'Бухгалтер'
]

names_of_roles_list.each do |name|
  Role.create(name: name)
end

questions_list = [
    'Что такое страница компании?',
    'Как отредактировать страницу компании?',
    'Как удалить существующую страницу компании?',
    'Как добавить страницу компании?',
    'Как сотрудники появляются на странице компании?',
    'Как отредактировать страницу компании?',
    'Кто может добавить страницу компании?',
    'Как добавить текущих сотрудников на страницу компании?',
    'Как удалить со страницы компании людей, которые в ней не работают?',
    'Как узнать, кто просматривал страницу моей компании?',
    'Как разместить вакансию на странице компании?',
    'Какие этапы отбора я должен пройти, чтобы попасть к вам?',
    'Как я могу узнавать о новых вакансиях?',
    'В каких городах есть офисы компании?',
    'Почему стоит выбрать вашу компанию?',
    'С какими торговыми сетями вы работаете?',
    'Как начать работу с вашей компанией?',
    'Какая минимальная сумма заказа?',
    'Как можно ознакомиться с полным ассортиментом компании?',
    'Как оформить заказ?'
]

questions_list.each_with_index do |name, index|
  Question.create(name: name, position: index + 1)
end

FactoryGirl.create(:user)