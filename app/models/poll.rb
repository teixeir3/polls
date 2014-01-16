# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ActiveRecord::Base
  # attr_accessible :title, :body

end
