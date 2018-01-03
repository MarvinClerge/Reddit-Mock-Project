
15.times do
  User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "1234",
    birth_date: Faker::Date.birthday(18, 65)
  )
end



Category.destroy_all
categories = []
20.times do
  categories << Faker::Name.title.split(" ")[0]
end

def a
  [true,false].sample
end
categories.uniq.each do |category|
  
  Category.create(
    name: "#{category}#{" Marketplace" if a}",
    market: a
  )
end


Category.all.each do |cate|
  rand(10..40).times do
    Post.create!(
      content: Faker::HitchhikersGuideToTheGalaxy.marvin_quote * 3,
      post_type: ["text","url"].sample,
      title: Faker::HitchhikersGuideToTheGalaxy.specie,
      link: "http://www.google.com",
      category_id: cate.id,
      user_id: User.all.sample.id
    )
  end
end


Post.all.each do |post|
  10.times do
    Comment.create!(
      content: Faker::HitchhikersGuideToTheGalaxy.quote,
      user: User.all.sample,
      post: post
    )
  end
end
