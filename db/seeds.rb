# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.new(email:'admins@admins.com', password:'admins')
admin.save!


user = User.new(last_name:'前田', first_name:'慶次', last_name_kana:'マエダ', first_name_kana:'ケイジ', email:'maeda@maeda.com', password:'kmaeda', category_id:'1', target_time:'25200')
user.save!

1.upto(49) do |n|
  user = User.new(last_name:"苗字#{n}", first_name:"名前#{n}", last_name_kana:"ミョウジ#{n}", first_name_kana:"ナマエ#{n}", email:"email#{n}@email.com", password:"password#{n}", category_id:"8", target_time:"#{600*n}", created_at:"#{n.day.ago}")
  user.save!
end


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


Lesson.create(category_id:'1', rank_id:'1', name:'ロジックツリー', image: open("#{Rails.root}/db/fixtures/logic_tree.jpg"), video: open("#{Rails.root}/db/fixtures/test_movie.mp4"), description:'ロジック・ツリーとは、モレなくダブりなく（MECE）を意識して上位概念を下位の概念に分解していく際に用いられる思考ツールです。問題解決で、本質的な問題がどこにあるのかを絞り込む場面や本質的な課題に対して解決策を考える場面で活用できます。', time:'1800', status:'公開中')
Lesson.create(category_id:'1', rank_id:'1', name:'Win-Win', image: open("#{Rails.root}/db/fixtures/WinWin.jpg"), video: open("#{Rails.root}/db/fixtures/test_movie.mp4"), description:'ビジネスや交渉の場において、「負けたくない」「勝ちたい」という気持ちが芽生えることもあるのではないでしょうか。しかし、勝ち負けだけがビジネスや交渉の形ではありません。「Win-Win」とは、交渉者がともに利得を享受できることを指します。', time:'1800', status:'公開中')
Lesson.create(category_id:'1', rank_id:'1', name:'囚人のジレンマ', image: open("#{Rails.root}/db/fixtures/prisoners_dilemma.jpg"), video: open("#{Rails.root}/db/fixtures/test_movie.mp4"), description:'商談や交渉などの場面で、どのような戦略をとるべきかを考えるのに役立つゲーム理論の一つとして、「囚人のジレンマ」があります。「囚人のジレンマ」と聞くとビジネスには関係がないように聞こえるかもしれませんが、この考え方は私たちの日常やビジネスでの意思決定場面でもよく起こるものです。', time:'1800', status:'公開中')
Lesson.create(category_id:'1', rank_id:'1', name:'クリティカル・シンキングⅠ', image: open("#{Rails.root}/db/fixtures/critical_thinking.jpg"), video: open("#{Rails.root}/db/fixtures/test_movie.mp4"), description:'業種、職種、役職を問わずビジネスパーソンが業務のスピードとクオリティを効率よく高めるために必要不可欠な論理思考力。論理思考のベースとなる考え方を学び、実務で陥りやすい注意点を理解することで、実践で活用する能力を養います。', time:'1800', status:'公開中')
Lesson.create(category_id:'1', rank_id:'1', name:'フェルミ推定', image: open("#{Rails.root}/db/fixtures/fermi_estimation.jpg"), video: open("#{Rails.root}/db/fixtures/test_movie.mp4"), description:'フェルミ推定は、正確な数値がすぐに分からない時などに、入手しやすい情報等をもとに、論理的に推論し、概算の値を求めることです。コンサルティング会社や外資系企業の採用試験や面接で使われることもあり、論理的思考力を確認するために活用されることもあります。', time:'1800', status:'公開中')
Lesson.create(category_id:'1', rank_id:'2', name:'散布図', image: open("#{Rails.root}/db/fixtures/scatter_plot.jpg"), video: open("#{Rails.root}/db/fixtures/test_movie.mp4"), description:'散布図は2つの数字の関係を見ることができるグラフです。円グラフや折れ線グラフなどグラフには様々な種類がありますが、2つの変数の関係性を調べるときには、散布図が有効です。2つの数字を「比較」し、関係を見極めることで「因果関係」を推し量ることができます。', time:'1800', status:'公開中')
Lesson.create(category_id:'1', rank_id:'2', name:'相関分析', image: open("#{Rails.root}/db/fixtures/correlation_analysis.jpg"), video: open("#{Rails.root}/db/fixtures/test_movie.mp4"), description:'相関分析とは二次元の図表に2つの軸をとり各要素の関連性を見る分析手法です。物事の因果関係を見たり、物事に影響を与える重要な要素を見極めるヒントを得ることができます。', time:'1800', status:'公開中')
Lesson.create(category_id:'1', rank_id:'2', name:'クリティカル・シンキングⅡ', image: open("#{Rails.root}/db/fixtures/critical_thinking_2.jpg"), video: open("#{Rails.root}/db/fixtures/test_movie.mp4"), description:'「問題解決力」は新入社員から経営者まで、ビジネス、プライベートを問わず日常的に必要なスキルです。そもそも問題解決とは何かを、正しい問題解決のステップと、各ステップでの留意点を踏まえながら学んでいきます。', time:'1800', status:'公開中')
Lesson.create(category_id:'1', rank_id:'3', name:'演繹的／帰納的思考', image: open("#{Rails.root}/db/fixtures/inductive_thinking.jpg"), video: open("#{Rails.root}/db/fixtures/test_movie.mp4"), description:'演繹的／帰納的思考は、結論と根拠を適切に結びつける思考法で、論理的思考力を身につける上で必須となる思考法です。クリティカル・シンキングを学んでいる方は、ぜひこの思考法を理解しておきましょう。', time:'1800', status:'公開中')
Lesson.create(category_id:'1', rank_id:'3', name:'クリティカル・シンキングⅢ', image: open("#{Rails.root}/db/fixtures/critical_thinking_3.jpg"), video: open("#{Rails.root}/db/fixtures/test_movie.mp4"), description:'ビジネスで直面する課題の解決策を立案する上で、ある情報から仮説を立て、仮説の検証を進めながら成果につながる結論を生み出すことは、とても重要です。しかし、漫然と情報を集め、行動するのでは、効率的にビジネスを進めることはできません。与えられた情報から様々な仮説を導き、効率よく取捨選択を行っていくことが、ビジネスの意思決定スピードの差にもつながります。', time:'1800', status:'公開中')

1.upto(10) do |n|
  Lesson.create(category_id:'2', rank_id:'1', name:"communication#{n}", image:'', video:'', description:'description', time:'1800', status:"公開中", created_at:"#{1.day.ago}")
end
1.upto(10) do |n|
  Lesson.create(category_id:'3', rank_id:'1', name:"marketing#{n}", image:'', video:'', description:'description', time:'1800', status:"公開中", created_at:"#{1.day.ago}")
end
1.upto(10) do |n|
  Lesson.create(category_id:'4', rank_id:'1', name:"leadership#{n}", image:'', video:'', description:'description', time:'1800', status:"公開中", created_at:"#{1.day.ago}")
end
1.upto(10) do |n|
  Lesson.create(category_id:'5', rank_id:'1', name:"financial#{n}", image:'', video:'', description:'description', time:'1800', status:"公開中", created_at:"#{1.day.ago}")
end
1.upto(10) do |n|
  Lesson.create(category_id:'6', rank_id:'1', name:"global#{n}", image:'', video:'', description:'description', time:'1800', status:"公開中", created_at:"#{1.day.ago}")
end
1.upto(10) do |n|
  Lesson.create(category_id:'7', rank_id:'1', name:"carrer_building#{n}", image:'', video:'', description:'description', time:'1800', status:"公開中", created_at:"#{1.day.ago}")
end
1.upto(10) do |n|
  Lesson.create(category_id:'8', rank_id:'1', name:"technovate#{n}", image:'', video:'', description:'description', time:'1800', status:"公開中", created_at:"#{1.day.ago}")
end


1.upto(2) do |n|
  Attend.create(user_id:'1', category_id:'1', lesson_id:"#{n}", time:'1800', created_at:"#{n.day.ago}")
end
1.upto(6) do |n|
  Attend.create(user_id:'1', category_id:'2', lesson_id:"#{10+n}", time:'1800', created_at:"#{(7+n).day.ago}")
end
1.upto(3) do |n|
  Attend.create(user_id:'1', category_id:'3', lesson_id:"#{20+n}", time:'1800', created_at:"#{n.day.ago}")
end
1.upto(4) do |n|
  Attend.create(user_id:'1', category_id:'4', lesson_id:"#{30+n}", time:'1800', created_at:"#{n.day.ago}")
end
1.upto(3) do |n|
  Attend.create(user_id:'1', category_id:'5', lesson_id:"#{40+n}", time:'1800', created_at:"#{(14+n).day.ago}")
end
1.upto(10) do |n|
  Attend.create(user_id:'1', category_id:'6', lesson_id:"#{50+n}", time:'1800', created_at:"#{(7+n).day.ago}")
end
1.upto(2) do |n|
  Attend.create(user_id:'1', category_id:'7', lesson_id:"#{60+n}", time:'1800', created_at:"#{(14+n).day.ago}")
end
1.upto(6) do |n|
  Attend.create(user_id:'1', category_id:'8', lesson_id:"#{70+n}", time:'1800', created_at:"#{(14+n).day.ago}")
end
