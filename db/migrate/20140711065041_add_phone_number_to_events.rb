class AddPhoneNumberToEvents < ActiveRecord::Migration
  def change
    add_column :events, :phone_number, :string
  end
end
