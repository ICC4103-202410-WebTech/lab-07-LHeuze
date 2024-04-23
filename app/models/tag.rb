class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags
    validates :name, presence: { message: "Name can't be null" }, uniqueness: { message: "Tag already in use" }
  end
  