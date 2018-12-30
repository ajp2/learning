# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  poll_id    :integer          not null
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :text, presence: true
  
  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'AnswerChoice',
    dependent: :destroy

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    answer_choices_count = self.answer_choices
      .select("answer_choices.*, COUNT(responses.id) AS num_votes")
      .left_outer_joins(:responses)
      .where(answer_choices: { question_id: self.id })
      .group("answer_choices.id")

    results_hash = {}
    answer_choices_count.each do |answer_choice|
      results_hash[answer_choice.text] = answer_choice.num_votes
    end

    results_hash
  end
end


# SELECT
#   answer_choices.*, COUNT(responses.id)
# FROM
#   answer_choices
# LEFT OUTER JOIN
#   responses ON answer_choices.id = responses.answer_choice_id
# WHERE
#   answer_choices.question_id = ? (self.question_id)
# GROUP BY
#   answer_choices.id