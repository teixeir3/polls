# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  poll_id    :integer
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  # attr_accessible :title, :body

  validates :poll_id, :presence => true
  validates :text, :presence => true

  has_many(
    :answer_choices,
    :class_name => "AnswerChoice",
    :foreign_key => :question_id,
    :primary_key => :id
  )

  belongs_to(
    :poll,
    :class_name => "Poll",
    :foreign_key => :poll_id,
    :primary_key => :id
  )

end
