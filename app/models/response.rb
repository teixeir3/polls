# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer
#  responder_id     :integer
#  question_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ActiveRecord::Base
  # attr_accessible :title, :body
end
