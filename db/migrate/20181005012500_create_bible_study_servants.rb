class CreateBibleStudyServants < ActiveRecord::Migration[5.2]
  def change
    create_table :bible_study_servants do |t|
      t.references :bible_study
      t.references :user

      t.timestamps
    end
  end
end
