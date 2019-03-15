# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  u = User.create(email: 'kleenex0318@gmail.com', username: '재원', password: 'jaewon')
  puts u.errors.full_messages
  
  for i in 0..20
    p = Post.create(user_id: 1, title: 'hello', content: 'hi')
    puts p.errors.full_messages
  end

  for i in 1..20
    c = Comment.create(post_id: rand(1..20), user_id: 1, content: 'comment')
    puts c.errors.full_messages
  end
end