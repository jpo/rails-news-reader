class CreateFeedCategoriesUsers < ActiveRecord::Migration
  def up
    create_table :feed_categories_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :feed_category
    end
  end

  def down
    drop_table :feed_categories_users
  end
end
