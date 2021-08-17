class Cat < ApplicationRecord
  belongs_to :breed
  validates :name, :description, :image_url, presence: true
end
