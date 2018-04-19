# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
User.destroy_all

10.times do |i|
  user = User.create(email: "user#{i}@hotmail.com", name:"user#{i}", password: 123456, role: 1)
  post = user.posts.build(title: "post#{i}", content:"Bla bla blá")
  user.save
  10.times do |j|
    Comment.create(content: "comentario #{j} para el post #{i}", user_id: user.id, post_id: post.id)
  end
end

admin = User.create(email: "acartescc@gmail.com", name: "Andres", password: 123456, role: 0)
