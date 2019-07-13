# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.new(email:'admins@admins.com', password:'admins')
admin.save!

user = User.new(last_name:'武田', first_name:'信玄', last_name_kana:'タケダ', first_name_kana:'シンゲン', email:'takeda@takeda.com', password:'takeda', category_id:'', lesson_id:'', target_time:'', learning_time:'')
user.save!
user = User.new(last_name:'上杉', first_name:'謙信', last_name_kana:'ウエスギ', first_name_kana:'ケンシン', email:'uesugi@uesugi.com', password:'uesugi', category_id:'', lesson_id:'', target_time:'', learning_time:'')
user.save!

Category.create(name:'thinking')
Category.create(name:'communication')
Category.create(name:'marketing')
Category.create(name:'leadership')
Category.create(name:'financial')
Category.create(name:'global')
Category.create(name:'carrer_building')
Category.create(name:'technovate')

Rank.create(name:'初級')
Rank.create(name:'中級')
Rank.create(name:'上級')
Rank.create(name:'実践')

Lesson.create(category_id:'1', rank_id:'1', name:'ロジックツリー', image:'', video:'', description:'text', time:'900', status:'公開中')
Lesson.create(category_id:'1', rank_id:'2', name:'クリティカルシンキング', image:'', video:'', description:'text', time:'900', status:'公開中')
Lesson.create(category_id:'2', rank_id:'1', name:'プレゼンテーションスキル', image:'', video:'', description:'text', time:'900', status:'公開中')
Lesson.create(category_id:'2', rank_id:'2', name:'ネゴシエーションスキル', image:'', video:'', description:'text', time:'900', status:'公開中')