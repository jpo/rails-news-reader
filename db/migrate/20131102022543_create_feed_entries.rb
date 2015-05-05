class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.references :feed
      t.string     :title,     null: false
      t.string     :summary,   null: false
      t.string     :url,       null: false
      t.datetime   :published, null: false
      t.timestamps
    end
  end
end
