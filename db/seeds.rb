Language.create(title: "Ruby", pic_url: "" )
Language.create(title: "JavaScript", pic_url: "" )
Language.create(title: "Python", pic_url: "" )
Language.create(title: "C++", pic_url: "" )
Language.create(title: "C#", pic_url: "" )
Language.create(title: "PHP", pic_url: "" )
Language.create(title: "Perl", pic_url: "" )
Language.create(title: "Elixir", pic_url: "" )
Language.create(title: "Clojure", pic_url: "" )
Language.create(title: "Java", pic_url: "" )
Language.create(title: "Go", pic_url: "" )
Language.create(title: "Objective-c", pic_url: "" )
Language.create(title: "Rust", pic_url: "" )
Language.create(title: "Swift", pic_url: "" )
Language.create(title: "Scala", pic_url: "" )

15.times do
  Job.create(title: Faker::Name.title, company: Faker::Company.name, position: Faker::Lorem.word, salary: Faker::Number.number(5), date_posted: Faker::Date.between(10.days.ago, Date.today), description: Faker::Hipster.paragraph, language_id: Faker::Number.between(1, 15))
  Event.create(name: Faker::Hacker.ingverb, rsvp: Faker::Boolean.boolean, location: "#{Faker::Address.city}, #{Faker::Address.street_address}, #{Faker::Address.zip_code}", paid_event: Faker::Boolean.boolean, price: Faker::Number.decimal(2), members: Faker::Number.between(10, 100), language_id: Faker::Number.between(1, 15))
  User.create(username: Faker::Internet.user_name, password: Faker::Internet.password, avatar_pic: Faker::Avatar.image)
end

User.create(username: "Bromio", password: "bro", avatar_pic: Faker::Avatar.image)
User.create(username: "Bromasaurus-bro", password: "bro", avatar_pic: Faker::Avatar.image)
User.create(username: "Brosophino", password: "bro", avatar_pic: Faker::Avatar.image)
User.create(username: "Brosophina", password: "bro", avatar_pic: Faker::Avatar.image)
User.create(username: "Bro-ke", password: "bro", avatar_pic: Faker::Avatar.image)

i = 1
until i > 15 do
  User.find(i).languages << Language.find(i)
  User.find(i).events << Event.find(i)
  User.find(i).jobs << Job.find(i)
  i += 1
end
