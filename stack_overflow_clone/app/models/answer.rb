class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	has_many :comments, as: :commentable
	has_many :votes, as: :voteable

	validates :body, :user_id, presence: true

  def vote_count
    upvote_count = self.votes.where(value: 1).count
    downvote_count = self.votes.where(value: -1).count
    upvote_count - downvote_count
  end
end
