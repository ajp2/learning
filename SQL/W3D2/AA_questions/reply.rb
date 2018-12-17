require_relative 'base_model'
require_relative 'question'
require_relative 'question_follow'
require_relative 'reply'
require_relative 'question_like'

class Reply
  attr_accessor :question_id, :reply_id, :user_id, :body

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    return nil if data.length == 0
    Reply.new(data.first)
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    return nil if data.length == 0
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    return nil if data.length == 0
    data.map { |datum| Reply.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @reply_id = options['reply_id']
    @user_id = options['user_id']
    @body = options['body']
  end
  
  def save
    if @id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, self.question_id, self.reply_id, self.user_id, self.body)
        INSERT INTO
          replies (question_id, reply_id, user_id, body)
        VALUES
          (?, ?, ?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, self.question_id, self.reply_id, self.user_id, self.body, @id)
        UPDATE
          replies
        SET
          question_id = ?, reply_id = ?, user_id = ?, body = ?
        WHERE
          id = ?
      SQL
    end
end

  def author
    data = QuestionsDatabase.instance.execute(<<-SQL, self.user_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    return nil if data.length == 0
    User.new(data.first)
  end

  def question
    data = QuestionsDatabase.instance.execute(<<-SQL, self.question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    return nil if data.length == 0
    Question.new(data.first)
  end

  def parent_reply
    return nil if self.reply_id.nil?

    data = QuestionsDatabase.instance.execute(<<-SQL, self.reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    return nil if data.length == 0
    Reply.new(data.first)
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        reply_id = ?
    SQL

    return nil if data.length == 0
    data.map { |datum| Reply.new(datum) }
  end
end