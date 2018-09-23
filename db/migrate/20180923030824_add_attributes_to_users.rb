class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mobile_number, :string
    add_column :users, :birth_date, :date
    add_column :users, :confession_date, :date
    add_column :users, :holymass_date, :date
    add_column :users, :tnawol_date, :date
  end
end
