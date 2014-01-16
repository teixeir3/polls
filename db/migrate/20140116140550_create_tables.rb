class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name

      t.timestamps
    end

    create_table :polls do |t|
      t.integer :author_id
      t.string :title

      t.timestamps
    end

    create_table :questions do |t|
      t.integer :poll_id
      t.string :text

      t.timestamps
    end

    create_table :answer_choices do |t|
      t.string :text
      t.integer :question_id

      t.timestamps
    end

    create_table :responses do |t|
      t.integer :answer_choice_id
      t.integer :responder_id
      t.integer :question_id

      t.timestamps
    end
  end
end
