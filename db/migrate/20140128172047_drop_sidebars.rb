class DropSidebars < ActiveRecord::Migration
  def change
    drop_table :sidebars
  end
end
