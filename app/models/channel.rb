class Channel < ApplicationRecord
  has_many :discussions
  has_many :users, through: :discussions  # creates a join table (user => discussion || discussion => user)
  resourcify

  extend FriendlyId
  friendly_id :channel, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    channel_changed?
  end

end
