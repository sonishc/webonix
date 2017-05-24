namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
      users = User.all.limit(3)
      50.times do
        name = Faker::Lorem.sentence(2)
        description = Faker::Lorem.sentence(15)
        dead_line = Faker::Date.between(2.days.ago, Date.today)
        users.each { |user| user.projects.create!(name: name, description: description, dead_line: dead_line)}
      end
  end
end
