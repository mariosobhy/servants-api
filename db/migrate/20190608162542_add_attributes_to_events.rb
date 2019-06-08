class AddAttributesToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :attendees, :pray_before_service, :boolean, default: false
    add_column :attendees, :attend_time, :datetime
    add_column :attendees, :preparation, :boolean, default: false
    add_column :attendees, :lecturing, :boolean, default: false
    add_column :attendees, :missing_by_phone, :integer, default: 0
    add_column :attendees, :missing_by_visit, :integer, default: 0
    add_column :attendees, :osra_preparing_meeting, :boolean, default: false
  end
end
