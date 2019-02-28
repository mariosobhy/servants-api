class CreateClassroomServants < ActiveRecord::Migration[5.2]
  def change
    create_table :classroom_servants do |t|
      t.references :classroom, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
