class CreateTest < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.boolean :testingPeriod
      t.string :link
    end
    add_index :tests, :testingPeriod
  end
end
