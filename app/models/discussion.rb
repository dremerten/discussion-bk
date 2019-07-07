class Discussion < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :title, :content, :channel, :channel_id, presence: true
  resourcify

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end
end

# class Discussion < ApplicationRecord
#   belongs_to :channel
#   belongs_to :user
#   has_many :replies, dependent: :destroy  # if a discussion is deleted, so are the replies
#   #before_validation :check_for_existence
#   validates :title, :content, :channel_id, presence: true
#   validates :title, length: { minimum: 1, maximum: 50 }
#   validates :content, length: { minimum: 1, maximum: 500 }
#    # checks that all fields are filled in, in order to submit to a discussion
#   resourcify

#   extend FriendlyId
#   friendly_id :title, use: [:slugged, :finders]

#   def should_generate_new_friendly_id?
#     title_changed?
#   end

#   #private

#   #def check_for_existence
#     #self.attributes.each do |attr|
#       #return false if self[attr].nil?
#     #end
#   #end

# end
