User.create!(name: "Nguyen Ba Hung",
             email: "hungpronguyen256@gmail.com",
             password: "12345678",
             password_confirmation: "12345678",
             admin: true,
             activated: true,
             activated_at: Time.current)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.current)
end
