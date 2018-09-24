class CreateOsraServants < ActiveRecord::Migration[5.2]
  def change
    create_table :osra_servants do |t|
      t.references :osra
      t.references :user

      t.timestamps
    end
  end
end
