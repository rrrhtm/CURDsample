class Column < ApplicationRecord
  belongs_to :user, foreign_key: 'userid'
  mount_uploader :image, ImagesUploader
  validates :title, presence: true, length: { maximum: 51 }
  validates :body, presence: true
end
