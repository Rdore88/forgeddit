class Submission < ApplicationRecord
  has_many :comments
  has_many :votes
  belongs_to :user
  validates :title,  presence: true
  validates :link, presence: true
end
