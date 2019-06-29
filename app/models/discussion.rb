class Discussion < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :replies, dependent: :destroy  # if a discussion is deleted, so are the replies

  validates :title, :content, presence: true # checks that all fields are filled in, in order to submit to a discussion
  resourcify

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
