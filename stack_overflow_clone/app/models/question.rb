class Question < ActiveRecord::Base
	belongs_to :user
	has_many :votes, as: :voteable
	has_many :answers, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :question_tags
	has_many :tags, through: :question_tags

	validates :user_id, :title, :body, presence: true
	validates :title, uniqueness: true
end
