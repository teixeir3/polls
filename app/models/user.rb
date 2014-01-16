# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many(
    :authored_polls,
    :class_name => 'Poll',
    :foreign_key => 'author_id',
    :primary_key => :id
  )

  has_many(
    :responses,
    :class_name => 'Response',
    :foreign_key => 'responder_id',
    :primary_key => :id
  )
end
