class User < ApplicationRecord
  belongs_to :city
  has_many :comments
  has_many :likes
  has_many :gossips
  has_many :comment_of_comments
end
