class CreateWebsiteCategoryships < ActiveRecord::Migration
  def change
    create_table :website_categoryships do |t|
      t.references :website
      t.references :category

      t.timestamps
    end

    add_index :website_categoryships, :website_id
    add_index :website_categoryships, :category_id
    add_index :website_categoryships, [:category_id, :website_id], unique: true
  end
end
