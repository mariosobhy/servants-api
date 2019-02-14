class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.references :course, index: true

      t.timestamps
    end
  end
end
