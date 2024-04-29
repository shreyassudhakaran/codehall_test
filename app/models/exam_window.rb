class ExamWindow < ApplicationRecord
  validates :start_time, :end_time, presence: true, uniqueness: true
  validate :end_time_after_start_time?

  belongs_to :exam

  has_many :user_exams, dependent: :destroy

  scope :around, -> (user_start_time) { where(start_time: user_start_time.., start_time: ..user_start_time) }

  def end_time_after_start_time?
    if end_time < start_time
      errors.add :end_time, "must be after start time"
    end
  end
end
