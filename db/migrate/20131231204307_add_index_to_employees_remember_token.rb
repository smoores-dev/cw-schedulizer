class AddIndexToEmployeesRememberToken < ActiveRecord::Migration
  def change
    add_index :employees, :remember_token
  end
end
