class Reply < ApplicationRecord  # replies are unique to each user (only the owner or admin user can edit/destroy)
  belongs_to :discussion
  belongs_to :user
  validates :reply, presence: true # checks if content exists within reply field

  extend FriendlyId
  friendly_id :reply, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    reply_changed?
  end

end
