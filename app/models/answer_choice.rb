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
end
