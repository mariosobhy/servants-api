class CreateConferences < ActiveRecord::Migration[5.2]
  def change
    create_table :conferences do |t|
      t.string :name
      t.float :price, default: 0.0
      t.string :place
      t.integer :no_of_servants, default: 0

      t.timestamps
    end
  end
end
