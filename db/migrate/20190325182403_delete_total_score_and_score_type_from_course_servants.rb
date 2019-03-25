class DeleteTotalScoreAndScoreTypeFromCourseServants < ActiveRecord::Migration[5.2]
  def change
    remove_column :course_servants, :score_type 
    remove_column :course_servants, :total_score
  end
end
