class Website < ActiveRecord::Base
  has_many :website_categoryships, dependent: :destroy
  has_many :categories, through: :website_categoryships
end
