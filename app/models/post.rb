class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  belongs_to :author
  has_many :elements
  has_one_attached :header_image

  def should_generate_new_friendly_id?
    title_changed?
  end
end
