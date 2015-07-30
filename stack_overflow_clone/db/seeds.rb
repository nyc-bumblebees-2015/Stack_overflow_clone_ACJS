users = [
  {username: "spongebob",
   first_name: "sponge",
   last_name: "squarepants",
   email: "spongebob@gmail.com",
   password: "pineapple"},
  {username: "isuckatpokemon",
   first_name: "ash",
   last_name: "ketchum",
   email: "isuck@gmail.com",
   password: "123456"},
  {username: "cartman",
   first_name: "eric",
   last_name: "cartman",
   email: "southpark@gmail.com",
   password: "123456"},
]

questions = [
	{title: "where do you live?",
	 body: "I want to wash your plates",
	 user_id:1}
]

answers = [
	{body: "suck my ballz kyle",
	 user_id: 3,
	 question_id: 1}
]

comments = [
	{
	 commentable_id: 1,
	 commentable_type: "answer",
	 body: "i am the worst pokemon master ever",
	 user_id: 2}
]

question_tags = [
	{question_id: 1,
	 tag_id: 1}
]

tags = [
	{name: "poo"}
]

votes = [
	{value: 1,
	 user_id: 1,
	 voteable_id: 1,
	 voteable_type: "answer"}
]

users.each do |user|
	User.create(user)
end

questions.each do |question|
	Question.create(question)
end

question_tags.each do |qt|
	QuestionTag.create(qt)
end

tags.each do |tag|
	Tag.create(tag)
end

votes.each do |vote|
	Vote.create(vote)
end

answers.each do |answer|
	Answer.create(answer)
end

comments.each do |comment|
	Comment.create(comment)
end