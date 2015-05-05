class CreateFeedCategories < ActiveRecord::Migration
  def change
    create_table :feed_categories do |t|
      t.string  :name,     null: false
      t.integer :priority, null: false
      t.timestamps
    end
  end
end
