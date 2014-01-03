class AddWebMasterToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :webmaster, :boolean, default: false
  end
end
