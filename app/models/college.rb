class College < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :exams, dependent: :destroy
end
