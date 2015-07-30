class Vote < ActiveRecord::Base
  belongs_to :user 
  belongs_to :voteable, polymorphic: true

  validates :voteable_id, :voteable_type, :user_id, :value, presence: true
end
