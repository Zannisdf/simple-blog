Post.destroy_all
User.destroy_all
User.create(
  name: 'Juan',
  email: 'juan@thedog.com',
  password: '123456'
)

User.create(
  name: 'Chimu',
  email: 'chimuelo@thebird.com',
  password: '123456'
)

ids = User.pluck(:id)

15.times do
  Post.create(
    user_id: ids.sample,
    title: Faker::JapaneseMedia::OnePiece.sea,
    content: Faker::JapaneseMedia::OnePiece.quote
  )
end
