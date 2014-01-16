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

  validates :author_id, :presence => true
  validates :title, :presence => true

  belongs_to(
    :author,
    :class_name => 'User',
    :foreign_key => :author_id,
    :primary_key => :id
  )

  has_many(
    :questions,
    :class_name => 'Question',
    :foreign_key => :poll_id,
    :primary_key => :id
  )
end
