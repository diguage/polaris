class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :url
      t.string :host
      t.string :title
      t.string :favicon
      t.integer :sort, :limit => 8

      t.timestamps
    end
  end
end
