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

  def results
    #TRY IN PRY
    results_with_count = self.answer_choices
      .select("COUNT(*) AS results_count")
      .join(:responses)
      .group("responses.answer_choice_id")



    # n+1
    #
    # answers = Hash.new
    # self.answer_choices.each do |ac|
    #   answers[ac.text] = ac.responses.count
    # end
    #
    # answers
  end

end
