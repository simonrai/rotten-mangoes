namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(firstname: "Example",
                         lastname: "User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         created_at: "2014-04-04 22:19:00",
                         updated_at: "2014-04-04 22:19:00",
                         admin: true)
  end
end