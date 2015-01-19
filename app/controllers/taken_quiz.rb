get '/unreviewed_quizzes' do
  @user = current_user
  @unreviewed_quizzes = @user.unreviewed_quizzes
end