# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  text        :string(255)
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to(
    :question,
    :class_name => "Question",
    :foreign_key => :question_id,
    :primary_key => :id
  )

  has_many(
    :responses,
    :class_name => "Response",
    :foreign_key => :answer_choice_id,
    :primary_key => :id
  )
end
