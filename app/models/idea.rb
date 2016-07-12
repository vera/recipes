class Idea < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  mount_uploader :picture, PictureUploader
  belongs_to :category
  validates :category_id, presence: true
end
