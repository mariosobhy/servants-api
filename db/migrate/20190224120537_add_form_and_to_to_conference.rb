class AddFormAndToToConference < ActiveRecord::Migration[5.2]
  def change
    add_column :conferences, :start_date, :datetime
    add_column :conferences, :end_date, :datetime
  end
end
