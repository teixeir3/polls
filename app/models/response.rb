# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer
#  responder_id     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ActiveRecord::Base
  # attr_accessible :title, :body

  validates :answer_choice_id, :presence => true
  validates :responder_id, :presence => true

  validate :respondent_has_not_already_answered_question

  belongs_to(
    :answer_choice,
    :class_name => "AnswerChoice",
    :foreign_key => :answer_choice_id,
    :primary_key => :id
  )

  belongs_to(
    :respondent,
    :class_name => "User",
    :foreign_key => :responder_id,
    :primary_key => :id
  )

  def respondent_has_not_already_answered_question
    existing_responses = self.existing_responses

    unless existing_responses.empty? || existing_responses[0].id == self.id
      errors[:base] << "User has already answered this question."
    end
  end


  def existing_responses
    Response.find_by_sql([<<-SQL, self.responder_id, self.answer_choice_id])
    SELECT
      r.id, r.answer_choice_id, r.responder_id
    FROM
      (responses AS r JOIN answer_choices AS ac ON
       r.answer_choice_id = ac.id)
    WHERE
      responder_id = ?
      AND
      question_id =
     (SELECT
        ac.question_id
      FROM
        answer_choices AS ac
      WHERE
        ac.id = ?)
    SQL
  end
end
