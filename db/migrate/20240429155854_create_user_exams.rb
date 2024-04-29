class CreateUserExams < ActiveRecord::Migration[7.0]
  def change
    create_table :user_exams do |t|
      t.integer :user_id
      t.integer :exam_window_id
      t.datetime :start_time

      t.timestamps
    end
  end
end
