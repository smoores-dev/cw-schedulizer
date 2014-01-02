class CreateEventEmployees < ActiveRecord::Migration
  def change
    create_table :event_employees do |t|
      t.integer :event_id
      t.integer :employee_id

      t.timestamps
    end
    add_index :event_employees, :event_id
    add_index :event_employees, :employee_id
    add_index :event_employees, [:event_id, :employee_id], unique: true
  end
end
