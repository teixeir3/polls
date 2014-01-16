class AddIndexesForForeignKeys < ActiveRecord::Migration
  def change
    add_index :polls, :author_id, :presence => true
    add_index :questions, :poll_id, :presence => true
    add_index :answer_choices, :question_id, :presence => true
    add_index :responses, :answer_choice_id, :presence => true
    add_index :responses, :responder_id, :presence => true
    add_index :responses, :question_id, :presence => true

    add_index :users, :user_name, :unique => true, :presence => true
    add_index :polls, :title, :unique => true, :presence => true
    add_index :questions, :text, :presence => true
    add_index :answer_choices, :text, :presence => true
  end
end
