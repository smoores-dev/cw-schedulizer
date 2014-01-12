class ChangeContentTypeToText < ActiveRecord::Migration
  def change
    change_column :testimonials, :content, :text
  end
end
