class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  validates :voteable_id, :voteable_type, :user_id, :value, presence: true

  def can_vote?
    vote = Vote.where(voteable_id: self.voteable_id, voteable_type: self.voteable_type, user_id: self.user_id)
    return vote.empty?
  end

  def self.vote_count_for voteable
    Vote.where(voteable_id: voteable.id).where(voteable_type:voteable.class.name).sum(:value)
  end

end
