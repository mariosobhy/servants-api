class AddStarDateAndEndDateToSpiritualDay < ActiveRecord::Migration[5.2]
  def change
    add_column :spiritual_days, :start_date, :datetime
    add_column :spiritual_days, :end_date, :datetime
  end
end
