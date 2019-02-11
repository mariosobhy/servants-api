class CreateChurches < ActiveRecord::Migration[5.2]
  def change
    create_table :churches do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
