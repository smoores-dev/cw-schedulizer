class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :place
      t.datetime :date
      t.datetime :start

      t.timestamps
    end
    add_index :events, :date
  end
end
