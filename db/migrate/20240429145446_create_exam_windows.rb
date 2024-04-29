class CreateExamWindows < ActiveRecord::Migration[7.0]
  def change
    create_table :exam_windows do |t|
      t.integer :exam_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
