class CreateCourseMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :course_meetings do |t|
      t.references :course
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
