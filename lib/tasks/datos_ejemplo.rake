namespace :db do
  desc "Rellenar Base de Datos con Ejemplos"
  task populate: :environment do
    def make_users
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

    def make_posts
      usuarios=Usuario.all(limit:6)
      50.times do
      contenido = Faker::Lorem.sentence(5)
      usuarios.each { |usuario| usuario.microposts.create!(contenido: contenido)}
      end
      end
    end

    def make_relationship
      usuarios = Usuario.all
      usuario  = usuarios.first
      followed_users = usuarios[2..50]
      followers      = usuarios[3..40]
      followed_users.each { |followed| usuario.follow!(followed) }
      followers.each      { |follower| follower.follow!(usuario) }
    end

end