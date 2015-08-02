class User < ActiveRecord::Base
	has_secure_password
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, :first_name, :last_name, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :username, length: {in: 6..21}
  validates :password, length: {in: 5..16}

end
