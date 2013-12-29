class Website < ActiveRecord::Base
  extend Enumerize

  scope :published, where(status: 1)

  enumerize :status, in: { :deleted => -1, :auditing => 0, :published => 1 }, default: :published

  belongs_to :user
  has_many :website_categoryships, dependent: :destroy
  has_many :categories, through: :website_categoryships
end
