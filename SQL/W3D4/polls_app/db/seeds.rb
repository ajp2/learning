# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
users = User.create([
  { username: 'test' },
  { username: 'testing' },
  { username: 'another_test' }
])

Poll.destroy_all
test_polls = Poll.create([
  { title: 'First test', author_id: users.first.id },
  { title: 'Second test', author_id: users.first.id },
  { title: 'Third test', author_id: users.first.id }
])

testing_polls = Poll.create([
  { title: 'Fourth test', author_id: users.second.id },
  { title: 'Fifth test', author_id: users.second.id },
  { title: 'Sixth test', author_id: users.second.id }
])

another_test_polls = Poll.create([
  { title: 'Seventh test', author_id: users.third.id },
  { title: 'Eighth test', author_id: users.third.id },
  { title: 'Ninth test', author_id: users.third.id }
])

Question.destroy_all
first_poll_questions = Question.create([
  { text: 'this is a test', poll_id: test_polls.first.id },
  { text: 'this is a test1', poll_id: test_polls.first.id },
])

second_poll_questions = Question.create([
  { text: 'this is a test2', poll_id: test_polls.second.id },
  { text: 'this is a test3', poll_id: test_polls.second.id },
])

AnswerChoice.destroy_all
first_question_choices = AnswerChoice.create([
  { text: '1', question_id: first_poll_questions.first.id },
  { text: '2', question_id: first_poll_questions.first.id },
  { text: '3', question_id: first_poll_questions.first.id },
  { text: '4', question_id: first_poll_questions.first.id }
])

second_question_choices = AnswerChoice.create([
  { text: '5', question_id: first_poll_questions.second.id },
  { text: '6', question_id: first_poll_questions.second.id },
  { text: '7', question_id: first_poll_questions.second.id },
  { text: '8', question_id: first_poll_questions.second.id }
])

Response.destroy_all
test_responses = Response.create([
  { user_id: users.first.id, answer_choice_id: first_question_choices.first.id },
  { user_id: users.first.id, answer_choice_id: second_question_choices.first.id }
])

testing_responses = Response.create([
  { user_id: users.second.id, answer_choice_id: first_question_choices.second.id },
  { user_id: users.second.id, answer_choice_id: second_question_choices.second.id }
])

another_test_responses = Response.create([
  { user_id: users.third.id, answer_choice_id: first_question_choices.third.id },
  { user_id: users.third.id, answer_choice_id: second_question_choices.third.id }
])