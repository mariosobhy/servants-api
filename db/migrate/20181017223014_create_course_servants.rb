class CreateCourseServants < ActiveRecord::Migration[5.2]
  def change
    create_table :course_servants do |t|
      t.references :course
      t.references :user

      t.timestamps
    end
  end
end
