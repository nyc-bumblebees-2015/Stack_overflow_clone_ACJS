class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	belongs_to :comment
	has_many :votes, as: :voteable

	validates :body, :user_id, presence: true
end
