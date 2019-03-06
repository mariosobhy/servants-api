class AddOsraIdToSpiritualDay < ActiveRecord::Migration[5.2]
  def change
    add_reference :spiritual_days, :osra, index: true
  end
end
