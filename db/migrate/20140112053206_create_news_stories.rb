class CreateNewsStories < ActiveRecord::Migration
  def change
    create_table :news_stories do |t|
      t.string :title
      t.string :snippet
      t.string :url

      t.timestamps
    end
  end
end
