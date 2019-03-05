class AddColumsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mobile_number, :string, array: true, default: []
    add_column :users, :tnawol_date, :datetime, array: true, default: []
    add_column :users, :confession_date, :datetime, array: true, default: []
  end
end
