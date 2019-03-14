class CreateAminOsras < ActiveRecord::Migration[5.2]
  def change
    create_table :amin_osras do |t|
      t.references :user, index: true
      t.references :osra, index: true

      t.timestamps
    end
  end
end
