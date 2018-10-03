class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :date
      t.references :eventable, polymorphic: true

      t.timestamps
    end
  end
end
