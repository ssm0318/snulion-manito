# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "sangw876@naver.com", username: "한상우", password: "snulion")
User.create(email: "hyesoo5115@snu.ac.kr", username: "김혜수", password: "snulion")
User.create(email: "yesjin_nav@naver.com", username: "김응진", password: "snulion")
User.create(email: "tyj9327@gmail.com", username: "장태영", password: "snulion")
User.create(email: "yeppilisa@naver.com", username: "안예지", password: "snulion")
User.create(email: "srbin9444@gmail.com", username: "이설빈", password: "snulion")
User.create(email: "curious.curieyoo@gmail.com", username: "유규리", password: "snulion")
User.create(email: "bin4021@naver.com", username: "조영빈", password: "snulion")
User.create(email: "juhee8425@snu.ac.kr", username: "송주희", password: "snulion")
User.create(email: "gakyunggg297@gmail.com", username: "이가경", password: "snulion")
User.create(email: "kingzzang5@naver.com", username: "김민기", password: "snulion")
User.create(email: "njs03332@gmail.com", username: "김유리", password: "snulion")
User.create(email: "yeeunshin@naver.com", username: "신예은", password: "snulion")
User.create(email: "kwonij2@snu.ac.kr", username: "권일재", password: "snulion")
User.create(email: "rapace0215@gmail.com", username: "김나경", password: "snulion")
User.create(email: "maeng9584@gmail.com", username: "맹재우", password: "snulion")
User.create(email: "jenny5546@naver.com", username: "이재은", password: "snulion")
User.create(email: "cjhanist@gmail.com", username: "한창진", password: "snulion")
User.create(email: "wldms5764@gmail.com", username: "송지은", password: "snulion")
User.create(email: "gjinsun96@gmail.com", username: "구진선", password: "snulion")
User.create(email: "gustkd3@gmail.com", username: "한현상", password: "snulion")
User.create(email: "chaaaamni@gmail.com", username: "임채민", password: "snulion")
User.create(email: "psyeon990@naver.com", username: "박성연", password: "snulion")
User.create(email: "Yeongrok.Jeong@gmail.com", username: "정영록", password: "snulion")
User.create(email: "jun9894@naver.com", username: "김경준", password: "snulion")
User.create(email: "pdahee329@gmail.com", username: "박다희", password: "snulion")
User.create(email: "dwmin95@snu.ac.kr", username: "민대원", password: "snulion")
User.create(email: "1004_hyunji@naver.com", username: "이현지", password: "snulion")
User.create(email: "smr603@snu.ac.kr", username: "최연석", password: "snulion")
User.create(email: "lsm3191@snu.ac.kr", username: "이수민", password: "snulion")
User.create(email: "kleenex0318@gmail.com", username: "김재원", password: "snulion")
# puts u.errors.full_messages

# Relationship
for i in 1..30
  Relationship.create(manito_id: i, manitee_id: i + 1)
end
Relationship.create(manito_id: 30, manitee_id: 1)

if Rails.env.development?
  # Posts
  for i in 0..60
    p = Post.create(user_id: rand(1..30), title: 'hello', content: 'hi')
    # puts p.errors.full_messages
  end

  for i in 0..60
    c = Comment.create(post_id: rand(1..60), user_id: rand(1..30), content: 'comment')
    # puts c.errors.full_messages
  end

  for i in 1..30
    p = Post.create(user_id: 2, title: "hello", content: "hihihi")
    # puts p.errors.full_messages
  end

  for i in 1..30
    p = Post.create(user_id: 1, title: "hello", content: "hihihi")
    # puts p.errors.full_messages
  end

  for i in 0..60
    c = Comment.create(post_id: rand(61..120), user_id: rand(1..3), content: 'comment')
    # puts c.errors.full_messages
  end
end