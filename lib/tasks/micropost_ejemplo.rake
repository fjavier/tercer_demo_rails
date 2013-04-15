namespace :db do
  desc "Rellenar Base de Datos con Ejemplos"
  task populate: :environment do
    Usuario.create!(name: "Francisco Javier",
                 email: "fjavier.cgam@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@foo.bar"
      password  = "password"
      Usuario.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end