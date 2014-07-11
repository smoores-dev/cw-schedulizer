class AddCheckInToEventEmployees < ActiveRecord::Migration
  def change
    add_column :event_employees, :check_in, :datetime
  end
end
