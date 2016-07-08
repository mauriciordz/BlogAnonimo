class Post < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :presence => true
  validates :description, :presence => true
  
  has_many :posts_tags
  has_many :tags, through: :posts_tags
end
