class CreateConferenceServants < ActiveRecord::Migration[5.2]
  def change
    create_table :conference_servants do |t|
      t.references :conference
      t.references :user

      t.timestamps
    end
  end
end
