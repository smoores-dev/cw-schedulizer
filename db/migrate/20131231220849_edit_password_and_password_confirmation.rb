class EditPasswordAndPasswordConfirmation < ActiveRecord::Migration
  def change
    change_column :employees, :password, :string, default: "watchers123"
    change_column :employees, :password_confirmation, :string, default: "watchers123"
  end
end
