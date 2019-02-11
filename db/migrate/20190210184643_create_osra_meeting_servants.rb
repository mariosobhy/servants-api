class CreateOsraMeetingServants < ActiveRecord::Migration[5.2]
  def change
    create_table :osra_meeting_servants do |t|
      t.references :osra_meeting, index: true
      t.references :osra_servant, index: true
      t.boolean :pray_before_sevice, default: false
      t.boolean :preparation, default: false
      t.boolean :speech, default: false
      t.string :visiting_abscene
      t.string :phone_abscene
      t.boolean :osra_meeting_preparation, default: false

      t.timestamps
    end
  end
end
