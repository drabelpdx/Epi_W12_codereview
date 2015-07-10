class Category < ActiveRecord::Base
  has_many :projects
  validates :name, :presence => true
  validates :description, :presence => true
end
