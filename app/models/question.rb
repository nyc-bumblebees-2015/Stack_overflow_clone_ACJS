class Question < ActiveRecord::Base

	belongs_to :user
	has_many :votes, as: :voteable
	has_many :answers, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :question_tags
	has_many :tags, through: :question_tags

	validates :user_id, :title, :body, presence: true
	validates :title, uniqueness: true

  def tags_as_string
    tags.map{ |tag| tag.name }.join(',')
  end

  def self.by_vote_count
    Question.joins(:votes).group('questions.id').order('sum(votes.value) desc')
  end

  def vote_count
    Vote.vote_count_for self
  end

end
