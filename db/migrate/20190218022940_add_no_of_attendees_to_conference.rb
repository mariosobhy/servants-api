class AddNoOfAttendeesToConference < ActiveRecord::Migration[5.2]
  def change
    add_column :conferences, :no_of_attendees, :integer, default: 0
  end
end
