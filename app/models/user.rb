class User < ApplicationRecord
  belongs_to :city
  has_many :comments
  has_many :likes
  has_many :gossips
end
