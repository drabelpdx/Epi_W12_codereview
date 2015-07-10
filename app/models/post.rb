class Post < ActiveRecord::Base
  has_many :commnets
  validates :title, :presence => true
  validates :body, :presence => true
end
