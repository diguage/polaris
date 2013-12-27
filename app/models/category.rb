class Category < ActiveRecord::Base
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Category'

  has_many :website_categoryships, dependent: :destroy
  has_many :websites, through: :website_categoryships
end
