# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validate :respondent_already_answered?, :respondent_is_creator?
  after_destroy :log_destroy_action

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_one :question,
    through: :answer_choice,
    source: :question

  def log_destroy_action
    puts "Response destroyed"
  end

  def sibling_responses
    all_responses = self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    if sibling_responses.exists?(user_id: self.user_id)
      errors[:user] << "cannot respond to question multiple times"
    end
  end

  def respondent_is_creator?
    question_author_id = self.question.poll.author_id
    if question_author_id == self.user_id
      errors[:user] << "cannot vote on poll they have created"
    end
  end
end
