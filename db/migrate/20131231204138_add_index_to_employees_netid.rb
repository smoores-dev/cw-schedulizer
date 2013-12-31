class AddIndexToEmployeesNetid < ActiveRecord::Migration
  def change
    add_index :employees, :netID, unique: true
  end
end
