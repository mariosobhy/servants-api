class AddOsraIdToConference < ActiveRecord::Migration[5.2]
  def change
    add_reference :conferences, :osra, index: true
  end
end
