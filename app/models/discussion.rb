class Discussion < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :replies, dependent: :destroy  # if a discussion is deleted, so are the replies
  #before_validation :check_for_existence
  validates :title, presence: true
  validates :content, presence: true
  validates :channel_id, presence: true, allow_blank: false # checks that all fields are filled in, in order to submit to a discussion
  resourcify

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end

  #private

  #def check_for_existence
    #self.attributes.each do |attr|
      #return false if self[attr].nil?
    #end
  #end

end
