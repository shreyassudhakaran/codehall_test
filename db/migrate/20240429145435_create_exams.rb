class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :college_id

      t.timestamps
    end
  end
end
