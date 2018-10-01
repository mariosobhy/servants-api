class CreateOsraMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :osra_meetings do |t|
      t.references :osra
      t.string :name
      t.date :start_date
      t.date :end_date
      t.time :from
      t.time :to
      t.string :repeat

      t.timestamps
    end
  end
end
