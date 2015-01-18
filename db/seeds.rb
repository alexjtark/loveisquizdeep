require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://studiomark.com/headshots-women.html"))

links = page.css('td img').map { |image| "http://studiomark.com/" + image['src'] }



20.times {
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    gender: ["Male", "Female"].sample, #undisclosed or sth as well?
    email: Faker::Internet.email,
    location: Faker::Address.city,
    birthdate: Faker::Date.date,
    image_url: links.sample,
    )
}

users = User.all

users.each do |user|

  2.times {
    user.quizzes.create(catchphrase: Faker::App.name)
  }

end

quizzes = Quiz.all

sample_questions = ["Do you like scary movies? If so, which is your favorite?", "Dichotomy: Chocolate or vanilla?", "Football or futbol?", "Tell me your idea of a perfect taco", "What's your religion?", "Edward or Jacob?", "My dog's name is Charlie. Will you be allergic?", "What're your thoughts on Bloomberg's attempted ban of 16oz sodas...", "East coast or West and why?", "Lupe or Eminem?", "Ruby or Python?", "Do you WOW?", "What are your two favorite hobbies?", "Are dating sites Kafkaesque?"]

quizzes.each do |quiz|
  questions_copy = sample_questions.dup #copies object contents
  5.times {
    quiz.questions.create(prompt: questions_copy.shift)
  }
end

def take_quiz(user, quiz)
  if user != quiz.user
    quiz.questions.each do |question|
      question.answers.create(response: Faker::Hacker.say_something_smart, user_id: user.id, prompt: question.prompt)
    end
  end
end










