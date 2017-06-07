class User < ApplicationRecord
  has_many :submissions
  has_many :comments
  has_many :votes
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :username,  presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(readable_password)
    encrypted_password = BCrypt::Password.create(readable_password)
    self.password_digest = encrypted_password
  end

end
