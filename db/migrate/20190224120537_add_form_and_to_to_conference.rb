class AddFormAndToToConference < ActiveRecord::Migration[5.2]
  def change
    add_column :conferences, :from, :datetime
    add_column :conferences, :to, :datetime
  end
end
