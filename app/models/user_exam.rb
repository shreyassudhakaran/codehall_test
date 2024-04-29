class UserExam < ApplicationRecord
  validates :start_time, presence: true

  belongs_to :user
  belongs_to :exam_window
end
