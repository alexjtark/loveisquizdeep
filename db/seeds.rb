require 'nokogiri'
require 'open-uri'
require 'date'

womens_page = Nokogiri::HTML(open("http://studiomark.com/headshots-women.html"))

women_links = womens_page.css('td img').map { |image| "http://studiomark.com/" + image['src'] }

mens_page = Nokogiri::HTML(open("http://studiomark.com/headshots-men.html"))

men_links = mens_page.css('td img').map { |image| "http://studiomark.com/" + image['src'] }

#create men

20.times {
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    gender: "Male", #undisclosed or sth as well?
    email: Faker::Internet.email,
    seeking: ["Male", "Female", "Both"].sample,
    location: Faker::Address.city,
    birthdate: Date.parse("#{rand(1960..2000)}-0#{rand(1..9)}-#{rand(10..30)}"),
    image_url: men_links.sample,
    bio: Faker::Lorem.paragraph,
    password: "a",
    password_confirmation: "a"
    )
}

#create women

20.times {
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    gender: "Female", #undisclosed or sth as well?
    email: Faker::Internet.email,
    seeking: ["Male", "Female", "Both"].sample,
    location: Faker::Address.city,
    birthdate: Date.parse("#{rand(1960..2000)}-0#{rand(1..9)}-#{rand(10..30)}"),
    image_url: women_links.sample,
    bio: Faker::Lorem.paragraph,
    password: "a",
    password_confirmation: "a"
    )
}

users = User.all

users.each do |user|

  2.times {
    user.created_quizzes.create(catchphrase: Faker::Lorem.words(3).join(""))
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
  5.times {
    quiz = quizzes.sample
    TakenQuiz.take_quiz(user, quiz)

    x = rand(2..9)
    if x%2 == 0
      Match.create(friender: user, friendee: quiz.creator)
    end
  }
end













