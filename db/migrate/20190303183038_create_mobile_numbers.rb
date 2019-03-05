class CreateMobileNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :mobile_numbers do |t|
      t.string :number
      t.references :user, index: true

      t.timestamps
    end
  end
end
