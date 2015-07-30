class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	belongs_to :answer
	has_many :votes, as: :voteable

	validates :question_id, :answer_id, :body, :user_id, presence: true
end
