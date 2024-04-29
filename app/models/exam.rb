class Exam < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :college_id }

  belongs_to :college

  has_many :exam_windows, dependent: :destroy
end
