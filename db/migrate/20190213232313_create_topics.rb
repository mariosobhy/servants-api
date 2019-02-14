class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :name
      t.text :content
      t.references :lecture, index: true

      t.timestamps
    end
  end
end
