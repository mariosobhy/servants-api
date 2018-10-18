class CreateSpiritualDays < ActiveRecord::Migration[5.2]
  def change
    create_table :spiritual_days do |t|
      t.string :name
      t.float :price
      t.string :place
      t.integer :no_of_servants

      t.timestamps
    end
  end
end
