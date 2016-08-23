class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :category_id, presence: true

  mount_uploader :picture, PictureUploader

  belongs_to :category

  has_and_belongs_to_many :ingredients
end
