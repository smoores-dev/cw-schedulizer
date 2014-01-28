class CreateSidebars < ActiveRecord::Migration
  def change
    create_table :sidebars do |t|
      t.string :title
      t.string :blurb
      t.boolean :current
    end
  end
end
