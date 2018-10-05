class CreateBibleStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :bible_studies do |t|
      t.string :name
      t.references :user
      t.integer :total_score

      t.timestamps
    end
  end
end
