class AddCheckOutToEventEmployees < ActiveRecord::Migration
  def change
    add_column :event_employees, :check_out, :datetime
  end
end
