class ChangeSnippetTypeToText < ActiveRecord::Migration
  def change
    change_column :news_stories, :snippet, :text
  end
end
