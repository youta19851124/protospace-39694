class Prototype < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_one_attached :image

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true, unless: :was_attached?
  validates :image_presence

  def was_attached?
    self.image.attached?
  end

  private

  def image_presence
    unless was_attached?
      errors.add(:image, "を添付してください")
    end
  end
end
