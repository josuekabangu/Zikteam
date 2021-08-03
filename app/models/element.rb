class Element < ApplicationRecord
  belongs_to :post
  has_rich_text :content
  has_one_attached :image
  has_one_attached :element_video

  def paragraph?
    element_type == "paragraph"
  end

  def image?
    element_type == "image"
  end

  def element_video?
    element_type == "element_video"
  end
end
