class ConvertPhoneNumberToArrayInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :mobile_number
    remove_column :users, :tnawol_date
    remove_column :users, :confession_date
  end
end
