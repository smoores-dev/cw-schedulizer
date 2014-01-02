class ChangeDateTimeTypes < ActiveRecord::Migration
  def change
    change_column :events, :date, :date
    change_column :events, :start, :time
  end
end
