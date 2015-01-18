require 'nokogiri'
require 'open-uri'
require 'date'

page = Nokogiri::HTML(open("http://studiomark.com/headshots-women.html"))

links = page.css('td img').map { |image| "http://studiomark.com/" + image['src'] }



20.times {
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    gender: ["Male", "Female"].sample, #undisclosed or sth as well?
    email: Faker::Internet.email,
    seeking: ["Male", "Female", "Both"].sample,
    location: Faker::Address.city,
    birthdate: Date.parse("#{rand(1960..2000)}-0#{rand(1..9)}-#{rand(10..30)}"),
    image_url: links.sample,
    bio: Faker::Lorem.paragraph,
    password: "a",
    password_confirmation: "a"
    )
}

users = User.all

users.each do |user|

  2.times {
    user.quizzes.create(catchphrase: Faker::Lorem.words(3).join(""))
  }

end

quizzes = Quiz.all

sample_questions = ["Do you like scary movies? If so, which is your favorite?", "Dichotomy: Chocolate or vanilla?", "Football or futbol?", "Tell me your idea of a perfect taco", "What's your religion?", "Edward or Jacob?", "My dog's name is Charlie. Will you be allergic?", "What're your thoughts on Bloomberg's attempted ban of 16oz sodas...", "East coast or West and why?", "Lupe or Eminem?", "Ruby or Python?", "Do you WOW?", "What are your two favorite hobbies?", "Are dating sites Kafkaesque?"]

quizzes.each do |quiz|
  questions_copy = sample_questions.dup #copies object contents
  5.times {
    quiz.questions.create(prompt: questions_copy.shift)
    questions_copy.shuffle
  }
end

users.each do |user|
  quizzes = Quiz.all
  quiz = quizzes.sample
  5.times {
    TakenQuiz.take_quiz(user, quiz)
  }
end














