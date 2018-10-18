class CreateSpiritualDayServants < ActiveRecord::Migration[5.2]
  def change
    create_table :spiritual_day_servants do |t|
      t.references :spiritual_day
      t.references :user

      t.timestamps
    end
  end
end
