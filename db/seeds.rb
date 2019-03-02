Post.destroy_all
15.times do
  Post.create(
    user_id: 1,
    title: Faker::JapaneseMedia::OnePiece.sea,
    content: Faker::JapaneseMedia::OnePiece.quote
  )
end
