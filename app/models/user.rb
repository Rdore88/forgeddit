class User < ApplicationRecord
  has_many :sessions
  has_many :submissions
  has_many :comments
  validates :username,  presence: true
  validates :email, presence: true
end
