class ChangeSidebarCurrentDefaultToTrue < ActiveRecord::Migration
  def change
    change_column :sidebars, :current, :boolean, default: true
  end
end
