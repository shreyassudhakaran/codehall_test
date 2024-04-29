class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :phone, presence: true, uniqueness: true

  has_many :user_exams, dependent: :destroy
end
