class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :netID
      t.string :password
      t.string :password_confirmation
      t.string :password_digest
      t.string :remember_token, :string
      t.boolean :exec, default: false

      t.timestamps
    end
  end
end
