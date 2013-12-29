class AddStatusUserIdToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :status, :integer, :default => 0
    add_column :websites, :user_id, :integer, :references=>"users"
  end
end
