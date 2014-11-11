class Favorite < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates_uniqueness_of :track_id
  max_paginates_per 10
end
