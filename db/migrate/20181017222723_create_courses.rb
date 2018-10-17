class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :no_of_lectures
      t.integer :total_score
      t.references :user

      t.timestamps
    end
  end
end
