class CreateConferences < ActiveRecord::Migration[5.2]
  def change
    create_table :conferences do |t|
      t.string :name
      t.float :price
      t.string :place
      t.integer :no_of_servants

      t.timestamps
    end
  end
end
