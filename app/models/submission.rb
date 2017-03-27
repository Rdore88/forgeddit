class Submission < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :title,  presence: true
  validates :link, presence: true
end
